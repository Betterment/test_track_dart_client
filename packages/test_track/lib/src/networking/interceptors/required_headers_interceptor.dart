import 'package:dio/dio.dart';

/// An [Interceptor] that adds headers required to communicate with TestTrack to each
/// request.
class RequiredHeadersInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final requiredHeaders = <String, String>{
      Headers.acceptHeader: 'application/json; charset=utf-8',
      Headers.contentTypeHeader: 'application/json; charset=utf-8',
    };
    return super.onRequest(
      options.copyWith(
        headers: options.headers..addAll(requiredHeaders),
      ),
      handler,
    );
  }
}
