import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:test_track/src/networking/interceptors/system_proxy_interceptor.dart';

import '../fakes/fake_request_interceptor_handler.dart';

void main() {
  group('SystemProxyInterceptor', () {
    group('when proxy getter returns null', () {
      final subject = SystemProxyInterceptor(
        systemProxyGetter: () async => null,
      );

      setUp(() => HttpOverrides.global = null);

      test('it does not set HttpOverrides', () async {
        await subject.onRequest(
          RequestOptions(path: '/foo'),
          FakeRequestInterceptorHandler(onNext: (_) {}),
        );
        expect(HttpOverrides.current, isNull);
      });
    });

    group('when proxy getter returns non-null', () {
      final subject = SystemProxyInterceptor(
        systemProxyGetter: () async => {'host': 'foo', 'port': 'bar'},
      );

      test('it sets HttpOverrides', () async {
        await subject.onRequest(
          RequestOptions(path: '/foo'),
          FakeRequestInterceptorHandler(onNext: (_) {}),
        );
        expect(HttpOverrides.current, isNotNull);
      });
    });
  });
}
