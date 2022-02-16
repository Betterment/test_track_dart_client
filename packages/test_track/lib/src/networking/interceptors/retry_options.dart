import 'package:dio/dio.dart';

class RetryOptions {
  final int attempts;
  final Duration retryInterval;
  static const _retryRequestKey = 'retry_request';

  RetryOptions({this.attempts = 3, Duration? retryInterval})
      : retryInterval = retryInterval ?? const Duration(seconds: 1);

  static RetryOptions? fromRequestOptions(RequestOptions request) {
    return request.extra[_retryRequestKey] as RetryOptions?;
  }

  bool shouldRetry(DioError error, {required bool isIdempotent}) {
    if (attempts <= 0) return false;

    if (error.type == DioErrorType.connectTimeout) return true;

    if (error.type == DioErrorType.receiveTimeout && isIdempotent) return true;

    return false;
  }

  Map<String, dynamic> toExtraOptions() {
    return <String, dynamic>{
      _retryRequestKey: this,
    };
  }

  RetryOptions copyWith({
    int? attempts,
    Duration? retryInterval,
  }) =>
      RetryOptions(
        attempts: attempts ?? this.attempts,
        retryInterval: retryInterval ?? this.retryInterval,
      );
}
