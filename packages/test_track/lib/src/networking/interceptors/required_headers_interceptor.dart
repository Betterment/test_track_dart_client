import 'package:dio/dio.dart';

/// An [Interceptor] that adds headers required to communicate with TestTrack to each
/// request.
class RequiredHeadersInterceptor extends Interceptor {
  static const _requiredHeaders = <String, String>{
    Headers.acceptHeader: 'application/json; charset=utf-8',
    Headers.contentTypeHeader: 'application/json; charset=utf-8',
  };
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return super.onRequest(
      options.copyWith(
        headers: options.headers..addAll(_requiredHeaders),
      ),
      handler,
    );
  }
}
