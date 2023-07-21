import 'package:dio/dio.dart';
import 'package:test_track/src/logging/test_track_logger.dart';

/// {@template logging_interceptor}
/// An [Interceptor] responsible for logging network
/// activity via the provided [TestTrackLogger]
/// {@endtemplate}
class LoggingInterceptor extends Interceptor {
  final TestTrackLogger _logger;

  /// {@macro logging_interceptor}
  LoggingInterceptor({
    required TestTrackLogger logger,
  }) : _logger = logger;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_logger.shouldEnableNetworkLogging) {
      super.onRequest(options, handler);
      return;
    }

    _logger
        .debug('TestTrack HttpClient - ⬆️ [${options.method}] ${options.uri}');
    _logger.debug('headers: ${options.headers}');
    if (options.data != null) {
      _logger.debug('\t data: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!_logger.shouldEnableNetworkLogging) {
      super.onError(err, handler);
      return;
    }

    final statusCode = err.response?.statusCode != null
        ? ' [${err.response?.statusCode}]'
        : '';
    final requestUri = ' ${err.requestOptions.uri}';

    _logger.debug('TestTrack HttpClient - 🛑 ERROR$statusCode$requestUri');
    if (err.response?.data != null) {
      _logger.debug('\t data: ${err.response?.data}');
    } else {
      _logger.debug('\t message: ${err.message}');
    }

    super.onError(err, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (!_logger.shouldEnableNetworkLogging) {
      super.onResponse(response, handler);
      return;
    }

    _logger.debug(
        'TestTrack HttpClient - ⬇️ [${response.statusCode}] ${response.requestOptions.uri}');
    if (response.data != null) {
      _logger.debug('\t data: ${response.data}');
    }

    super.onResponse(response, handler);
  }
}
