import 'package:charlatan/charlatan.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sturdy_http/sturdy_http.dart';
import 'package:test/test.dart';
import 'package:test_track/src/networking/interceptors/retry_interceptor.dart';
import 'package:test_track/src/networking/interceptors/retry_options.dart';

import '../fakes/fake_error_interceptor_handler.dart';
import '../fakes/fake_http_client.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('RetryInterceptor', () {
    late DioException? errorFromOnNextInvocation;
    var numberOfErrorHandlerOnNextInvocations = 0;
    final defaultHandler = FakeErrorInterceptorHandler(
      onNextInvoked: (err) {
        numberOfErrorHandlerOnNextInvocations++;
        errorFromOnNextInvocation = err;
      },
    );

    RetryInterceptor buildSubject({
      required RetryOptions retryOptions,
      ErrorInterceptorHandler? errorInterceptorHandler,
      Charlatan? charlatan,
    }) {
      errorInterceptorHandler ??= defaultHandler;
      charlatan ??= Charlatan();
      final client = FakeSturdyHttp(charlatan);
      return RetryInterceptor(
        clientGetter: () => client,
        retryOptions: retryOptions,
      );
    }

    setUp(() {
      errorFromOnNextInvocation = null;
      numberOfErrorHandlerOnNextInvocations = 0;
    });

    group('onError', () {
      group('when it should retry the request', () {
        final DioException initialError = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(
            method: 'GET',
            path: '/foo',
            extra: <String, dynamic>{'is_idempotent': true},
            cancelToken: CancelToken(),
            onReceiveProgress: (_, _) {},
            onSendProgress: (_, _) {},
            data: {'foo', 'bar'},
          ),
        );

        void expectRetryRequestSameAsFailedRequest(RequestOptions request) {
          final errorOptions = initialError.requestOptions;
          expect(request.cancelToken, errorOptions.cancelToken);
          expect(request.data, errorOptions.data);
          expect(request.onReceiveProgress, errorOptions.onReceiveProgress);
          expect(request.onSendProgress, errorOptions.onSendProgress);
          expect(request.queryParameters, errorOptions.queryParameters);
        }

        group('and the original request has timeouts and a call deadline', () {
          final deadline = DateTime(2030);
          final errorWithTimeouts = DioException(
            type: DioExceptionType.connectionTimeout,
            requestOptions: RequestOptions(
              method: 'GET',
              path: '/foo',
              connectTimeout: const Duration(seconds: 1),
              receiveTimeout: const Duration(seconds: 2),
              sendTimeout: const Duration(seconds: 3),
              extra: <String, dynamic>{
                'is_idempotent': true,
                callDeadlineExtraKey: deadline,
              },
            ),
          );

          late CharlatanHttpRequest request;
          late RetryInterceptor subject;

          setUp(() {
            subject = buildSubject(
              retryOptions: RetryOptions(attempts: 1),
              charlatan:
                  Charlatan()..whenGet('/foo', (req) {
                    request = req;
                    return CharlatanHttpResponse(body: {'success': true});
                  }),
            );
          });

          test('it copies per-attempt timeouts onto the retry', () async {
            await subject.onError(errorWithTimeouts, defaultHandler);

            expect(
              request.requestOptions.connectTimeout,
              const Duration(seconds: 1),
            );
            expect(
              request.requestOptions.receiveTimeout,
              const Duration(seconds: 2),
            );
            expect(
              request.requestOptions.sendTimeout,
              const Duration(seconds: 3),
            );
          });

          test('it copies the call deadline onto the retry', () async {
            await subject.onError(errorWithTimeouts, defaultHandler);

            expect(
              request.requestOptions.extra[callDeadlineExtraKey],
              same(deadline),
            );
          });
        });

        group('and the retry request succeeds', () {
          test(
            'it retries the request with dio and returns the successful response',
            () async {
              late final Response<dynamic> response;
              final handler = FakeErrorInterceptorHandler(
                onResolveInvoked: (res) => response = res,
              );
              final successBody = {'success': true};
              late final CharlatanHttpRequest request;

              final subject = buildSubject(
                retryOptions: RetryOptions(attempts: 1),
                errorInterceptorHandler: handler,
                charlatan:
                    Charlatan()..whenGet('/foo', (req) {
                      request = req;
                      return CharlatanHttpResponse(body: successBody);
                    }),
              );

              await subject.onError(initialError, handler);
              expect(response.data, successBody);
              expectRetryRequestSameAsFailedRequest(request.requestOptions);
              expect(errorFromOnNextInvocation, isNull);
              expect(numberOfErrorHandlerOnNextInvocations, 0);
            },
          );
        });

        group('and the request fails', () {
          test(
            'it retries the request with dio and calls next on the handler with the retry request error',
            () async {
              final retryError = DioException(
                requestOptions: RequestOptions(path: 'errorPath'),
              );
              late final CharlatanHttpRequest request;
              final subject = buildSubject(
                retryOptions: RetryOptions(attempts: 1),
                charlatan:
                    Charlatan()..whenGet('/foo', (req) {
                      request = req;
                      throw retryError;
                    }),
              );

              await subject.onError(initialError, defaultHandler);
              expectRetryRequestSameAsFailedRequest(request.requestOptions);
              expect(errorFromOnNextInvocation, retryError);
              expect(numberOfErrorHandlerOnNextInvocations, 1);
            },
          );
        });
      });

      group('when it should not retry the request', () {
        test('it does not retry a call-timeout cancellation', () async {
          var requestCount = 0;
          final subject = buildSubject(
            retryOptions: RetryOptions(attempts: 1),
            charlatan:
                Charlatan()..whenGet('/foo', (_) {
                  requestCount++;
                  return CharlatanHttpResponse(body: {});
                }),
          );
          final error = DioException(
            type: DioExceptionType.cancel,
            error: CallTimeoutException(const Duration(seconds: 5)),
            requestOptions: RequestOptions(
              path: '/foo',
              extra: <String, dynamic>{'is_idempotent': true},
            ),
          );

          await subject.onError(error, defaultHandler);

          expect(numberOfErrorHandlerOnNextInvocations, 1);
          expect(requestCount, 0);
        });

        test('it calls next on the handler with the error', () async {
          final subject = buildSubject(retryOptions: RetryOptions());
          final error = DioException(
            requestOptions: RequestOptions(path: '/foo'),
          );

          await subject.onError(error, defaultHandler);

          expect(errorFromOnNextInvocation, error);
          expect(numberOfErrorHandlerOnNextInvocations, 1);
        });
      });
    });
  });
}
