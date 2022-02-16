import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track/src/networking/interceptors/retry_options.dart';

class RetryInterceptor extends Interceptor {
  final Dio _dio;
  final RetryOptions _retryOptions;

  RetryInterceptor({
    required Dio dio,
    RetryOptions? retryOptions,
  })  : _dio = dio,
        _retryOptions = retryOptions ?? RetryOptions();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    var extra = RetryOptions.fromRequestOptions(err.requestOptions) ?? _retryOptions;
    final isIdempotent = err.requestOptions.extra[HttpClient.isIdempotentOptionsKey] as bool? ?? false;

    if (extra.shouldRetry(err, isIdempotent: isIdempotent)) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future<dynamic>.delayed(extra.retryInterval);
      }

      extra = extra.copyWith(attempts: extra.attempts - 1);

      final extraOptions = extra.toExtraOptions()
        ..addAll(
          <String, dynamic>{HttpClient.isIdempotentOptionsKey: isIdempotent},
        );

      try {
        return await _dio.request<dynamic>(
          err.requestOptions.path,
          cancelToken: err.requestOptions.cancelToken,
          data: err.requestOptions.data,
          onReceiveProgress: err.requestOptions.onReceiveProgress,
          onSendProgress: err.requestOptions.onSendProgress,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(extra: extraOptions),
        );
      } on DioError catch (err) {
        return super.onError(err, handler);
      }
    }

    return super.onError(err, handler);
  }
}
