import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:test_track/src/networking/interceptors/retry_interceptor.dart';
import 'package:test_track/src/networking/interceptors/retry_options.dart';

import '../fakes/fake_error_interceptor_handler.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('RetryInterceptor', () {
    late Dio dio;
    late ErrorInterceptorHandler handler;
    late DioError? errorFromOnNextInvocation;
    var numberOfErrorHandlerOnNextInvocations = 0;

    RetryInterceptor buildSubject({
      required RetryOptions retryOptions,
    }) {
      handler = FakeErrorHandlerInterceptorHandler(onNextInvoked: (err) {
        numberOfErrorHandlerOnNextInvocations++;
        errorFromOnNextInvocation = err;
      });
      return RetryInterceptor(dio: dio, retryOptions: retryOptions);
    }

    setUp(() {
      dio = MockDio();
      errorFromOnNextInvocation = null;
      numberOfErrorHandlerOnNextInvocations = 0;
    });

    group('onError', () {
      group('when it should retry the request', () {
        late DioError error;
        late RetryInterceptor subject;

        setUp(() {
          subject = buildSubject(
            retryOptions: RetryOptions(
              attempts: 1,
            ),
          );

          error = DioError(
            type: DioErrorType.connectTimeout,
            requestOptions: RequestOptions(
              path: 'test.com',
              extra: <String, dynamic>{'is_idempotent': true},
            ),
          );
        });

        When whenDioRequests() {
          return when<dynamic>(
            () => dio.request<dynamic>(
              any(),
              cancelToken: any(named: 'cancelToken'),
              data: any<dynamic>(named: 'data'),
              onReceiveProgress: any(named: 'onReceiveProgress'),
              onSendProgress: any(named: 'onSendProgress'),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
            ),
          );
        }

        void verifyDioRequestCalledOnce() {
          verify(
            () => dio.request<dynamic>(
              'test.com',
              cancelToken: error.requestOptions.cancelToken,
              data: error.requestOptions.data,
              onReceiveProgress: error.requestOptions.onReceiveProgress,
              onSendProgress: error.requestOptions.onSendProgress,
              queryParameters: error.requestOptions.queryParameters,
              options: any(named: 'options'),
            ),
          ).called(1);
        }

        group('and the retry request succeeds', () {
          test('it retries the request with dio and returns the successful response', () async {
            final successResponse = Response<dynamic>(requestOptions: error.requestOptions);
            whenDioRequests().thenAnswer((_) async => successResponse);

            expect(await subject.onError(error, handler), successResponse);

            verifyDioRequestCalledOnce();
            expect(errorFromOnNextInvocation, isNull);
            expect(numberOfErrorHandlerOnNextInvocations, 0);
          });
        });

        group('and the request fails', () {
          test('it retries the request with dio and calls next on the handler with the retry request error', () async {
            final retryError = DioError(requestOptions: RequestOptions(path: 'errorPath'));
            whenDioRequests().thenThrow(retryError);

            await subject.onError(error, handler);

            verifyDioRequestCalledOnce();
            expect(errorFromOnNextInvocation, retryError);
            expect(numberOfErrorHandlerOnNextInvocations, 1);
          });
        });
      });

      group('when it should not retry the request', () {
        late RetryInterceptor subject;

        setUp(() {
          subject = buildSubject(
            retryOptions: RetryOptions(),
          );
        });
        test('it calls next on the handler with the error', () async {
          final error = DioError(requestOptions: RequestOptions(path: 'test.com'));

          await subject.onError(error, handler);

          expect(errorFromOnNextInvocation, error);
          expect(numberOfErrorHandlerOnNextInvocations, 1);
        });
      });
    });
  });
}
