import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_track/src/helpers/utils.dart';

/// A function that returns a map of proxy settings.
typedef SystemProxyGetter = Future<Map<String, String>?> Function();

/// {@template system_proxy_interceptor}
/// An interceptor that sets the system proxy. If the [SystemProxyGetter] returns
/// null, the request handled by [onRequest] will not be impacted.
///
/// This allows us to set the system proxy uniquely for each request which means
/// the correct proxy will be used if it changes at runtime.
/// {@endtemplate}
class SystemProxyInterceptor extends Interceptor {
  /// {@macro system_proxy_interceptor}
  SystemProxyInterceptor({required SystemProxyGetter systemProxyGetter})
    : _systemProxyGetter = systemProxyGetter;

  final SystemProxyGetter _systemProxyGetter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final proxy = await _systemProxyGetter();

    if (proxy != null) {
      final host = proxy['host'];
      final port = proxy['port'];
      final proxyString = '$host:$port';

      HttpOverrides.global = _HttpOverrides(
        clientBuilder:
            (client) =>
                client
                  ..badCertificateCallback = (cert, host, port) {
                    return Platform.isAndroid && isDebug();
                  }
                  ..findProxy = (_) => 'PROXY $proxyString',
      );
    }

    return super.onRequest(options, handler);
  }
}

class _HttpOverrides extends HttpOverrides {
  _HttpOverrides({required this.clientBuilder});

  final HttpClient Function(HttpClient) clientBuilder;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return clientBuilder(super.createHttpClient(context));
  }
}
