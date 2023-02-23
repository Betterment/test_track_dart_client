import 'package:dio/dio.dart';

class FakeRequestInterceptorHandler extends RequestInterceptorHandler {
  final void Function(RequestOptions options) onNext;

  FakeRequestInterceptorHandler({required this.onNext});

  @override
  void next(RequestOptions requestOptions) {
    return onNext(requestOptions);
  }
}
