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
  }) : _clientGetter = clientGetter,
       _retryOptions = retryOptions ?? RetryOptions();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    var extra =
        RetryOptions.fromRequestOptions(err.requestOptions) ?? _retryOptions;
    final isIdempotent =
        err.requestOptions.extra[isIdempotentOptionsKey] as bool? ?? false;
    final originalMethod = err.requestOptions.method;
    final capitalizedMethod = StringBuffer()
      ..write(originalMethod.substring(0, 1).toUpperCase())
      ..write(originalMethod.substring(1).toLowerCase());
    final requestType = NetworkRequestType.values.byName(
      capitalizedMethod.toString(),
    );

    if (extra.shouldRetry(err, isIdempotent: isIdempotent)) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future<dynamic>.delayed(extra.retryInterval);
      }

      extra = extra.copyWith(attempts: extra.attempts - 1);

      final extraOptions = extra.toExtraOptions()
        ..addAll(<String, dynamic>{isIdempotentOptionsKey: isIdempotent});
      final retry = RawRequest(
        err.requestOptions.path,
        type: requestType,
        cancelToken: err.requestOptions.cancelToken,
        data: RawRequestBody(err.requestOptions.data),
        onReceiveProgress: err.requestOptions.onReceiveProgress,
        onSendProgress: err.requestOptions.onSendProgress,
        queryParameters: err.requestOptions.queryParameters,
        options: Options(extra: extraOptions),
      );
      try {
        await _clientGetter().execute<dynamic, void>(
          retry,
          onResponse: (r) {
            DioException errorForRequest() {
              return DioException(requestOptions: err.requestOptions);
            }

            // We don't have access to the raw Response from `sturdy_http`, so
            // for both success cases, fabricate them. This should be fine for
            // most cases, and would require a `sturdy_http` change if we want
            // to gain access to the raw response.
            switch (r) {
              case OkResponse(:final response):
                handler.resolve(
                  Response(data: response, requestOptions: err.requestOptions),
                );
              case OkNoContent():
                handler.resolve(
                  Response(statusCode: 204, requestOptions: err.requestOptions),
                );
              case GenericError(:final error):
                throw error ?? errorForRequest();
              case UnprocessableEntity(:final error):
                throw error;
              case UpgradeRequired(:final error):
                throw error;
              case Unauthorized(:final error):
                throw error;
              case Forbidden(:final error):
                throw error;
              case NotFound(:final error):
                throw error;
              case ServerError(:final error):
                throw error;
              case ServiceUnavailable(:final error):
                throw error;
            }
          },
        );
      } on DioException catch (dioError) {
        return super.onError(dioError, handler);
      } on Exception {
        return super.onError(
          DioException(requestOptions: err.requestOptions, error: err),
          handler,
        );
      }
    } else {
      super.onError(err, handler);
    }
  }
}
