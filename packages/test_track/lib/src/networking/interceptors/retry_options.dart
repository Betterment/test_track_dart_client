import 'package:dio/dio.dart';

/// {@template retry_options}
/// An [Interceptor] responsible for logging network
/// activity via the provided [TestTrackLogger]
/// {@endtemplate}
class RetryOptions {
  /// The number of retry attempts remaining
  final int attempts;

  /// How often a retry attempt should be made
  final Duration retryInterval;
  static const _retryRequestKey = 'retry_request';

  /// {@macro retry_options}
  RetryOptions({this.attempts = 3, Duration? retryInterval})
      : retryInterval = retryInterval ?? const Duration(seconds: 1);

  /// Produces a [RetryOptions] object given a [RequestOptions] by
  /// parsing the extra produced by [toExtraOptions]
  static RetryOptions? fromRequestOptions(RequestOptions request) {
    return request.extra[_retryRequestKey] as RetryOptions?;
  }

  /// Whether another retry attempt should be performed
  bool shouldRetry(DioError error, {required bool isIdempotent}) {
    if (attempts <= 0) return false;

    if (error.type == DioErrorType.connectTimeout) return true;

    if (error.type == DioErrorType.receiveTimeout && isIdempotent) return true;

    return false;
  }

  /// Produces a [Map] with a key value pair containing
  /// the current state of retries, which can then be parsed
  /// from [RequestOptions] extras via [fromRequestOptions]
  Map<String, dynamic> toExtraOptions() {
    return <String, dynamic>{
      _retryRequestKey: this,
    };
  }

  // ignore: public_member_api_docs
  RetryOptions copyWith({
    int? attempts,
    Duration? retryInterval,
  }) =>
      RetryOptions(
        attempts: attempts ?? this.attempts,
        retryInterval: retryInterval ?? this.retryInterval,
      );
}
