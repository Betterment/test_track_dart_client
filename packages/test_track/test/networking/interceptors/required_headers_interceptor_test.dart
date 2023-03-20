import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:test_track/src/networking/interceptors/required_headers_interceptor.dart';

import '../fakes/fake_request_interceptor_handler.dart';

void main() {
  group('RequiredHeadersInterceptor', () {
    test('it adds expected headers', () {
      late final Map<String, dynamic>? headers;
      final subject = RequiredHeadersInterceptor();
      subject.onRequest(
        RequestOptions(path: '/foo', headers: <String, String>{}),
        FakeRequestInterceptorHandler(
            onNext: (options) => headers = options.headers),
      );

      expect(headers![Headers.acceptHeader], 'application/json; charset=utf-8');
      expect(headers![Headers.contentTypeHeader],
          'application/json; charset=utf-8');
    });
  });
}
