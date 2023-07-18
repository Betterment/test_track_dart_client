import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sturdy_http/sturdy_http.dart';
import 'package:test_track/src/networking/extras.dart';
import 'package:test_track/src/networking/interceptors/retry_options.dart';

/// Function that must return the [SturdyHttp] instance that will
/// handle the retry.
typedef SturdyHttpGetter = SturdyHttp Function();

/// {@template retry_interceptor}
/// An [Interceptor] responsible for performing retry
/// operations in the case of a failed network request
/// {@endtemplate}
class RetryInterceptor extends Interceptor {
  final SturdyHttpGetter _clientGetter;
  final RetryOptions _retryOptions;

  /// {@macro retry_interceptor}
  RetryInterceptor({
    required SturdyHttpGetter clientGetter,
    RetryOptions? retryOptions,
  })  : _clientGetter = clientGetter,
        _retryOptions = retryOptions ?? RetryOptions();

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    var extra =
        RetryOptions.fromRequestOptions(err.requestOptions) ?? _retryOptions;
    final isIdempotent =
        err.requestOptions.extra[isIdempotentOptionsKey] as bool? ?? false;
    final originalMethod = err.requestOptions.method;
    final capitalizedMethod = StringBuffer()
      ..write(originalMethod.substring(0, 1).toUpperCase())
      ..write(originalMethod.substring(1).toLowerCase());
    final requestType =
        NetworkRequestType.values.byName(capitalizedMethod.toString());

    if (extra.shouldRetry(err, isIdempotent: isIdempotent)) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future<dynamic>.delayed(extra.retryInterval);
      }

      extra = extra.copyWith(attempts: extra.attempts - 1);

      final extraOptions = extra.toExtraOptions()
        ..addAll(
          <String, dynamic>{isIdempotentOptionsKey: isIdempotent},
        );

      try {
        final retry = RawRequest(
          err.requestOptions.path,
          type: requestType,
          cancelToken: err.requestOptions.cancelToken,
          data: NetworkRequestBody.raw(err.requestOptions.data),
          onReceiveProgress: err.requestOptions.onReceiveProgress,
          onSendProgress: err.requestOptions.onSendProgress,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(extra: extraOptions),
        );
        await _clientGetter().execute<Response<dynamic>, void>(
          retry,
          onResponse: (r) {
            DioException errorForRequest() {
              return DioException(requestOptions: err.requestOptions);
            }

            r.when(
              ok: (res) => handler.resolve(res),
              okNoContent: () => handler.resolve(
                // Since we don't have access to the actual response,
                // fabricate one
                Response(
                  statusCode: 204,
                  requestOptions: RequestOptions(
                    path: err.requestOptions.path,
                  ),
                ),
              ),
              genericError: (_, __, error) => throw error ?? errorForRequest(),
              unprocessableEntity: (error, _) => throw error,
              unauthorized: (error) => throw error,
              forbidden: (error) => throw error,
              notFound: (error) => throw error,
              serverError: (error) => throw error,
              serviceUnavailable: (error) => throw error,
            );
          },
        );
      } on DioException catch (err) {
        return super.onError(err, handler);
      }
    }

    super.onError(err, handler);
  }
}
