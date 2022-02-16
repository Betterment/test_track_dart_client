import 'package:dio/dio.dart';
import 'package:test_track/src/helpers/extensions.dart';
import 'package:test_track/src/logging/logging.dart';
import 'package:test_track/src/networking/interceptors/logging_interceptor.dart';
import 'package:test_track/src/networking/interceptors/retry_interceptor.dart';

/// [HttpClient] provides production-ready network access using [Dio].
class HttpClient {
  static const isIdempotentOptionsKey = 'is_idempotent';
  final Dio _dio;

  String get baseUrl => _dio.options.baseUrl;

  HttpClient({
    required String baseUrl,
    required TestTrackLogger logger,
    HttpClientAdapter? customAdapter,
  }) : this._(
          Dio()
            ..options.baseUrl = baseUrl
            ..options.connectTimeout = 10000
            ..options.receiveTimeout = 20000
            ..map((dio) {
              final interceptors = [
                LoggingInterceptor(logger: logger),
                RetryInterceptor(dio: dio),
              ];

              dio.interceptors.addAll(interceptors);

              if (customAdapter != null) {
                return dio..httpClientAdapter = customAdapter;
              }
              return dio;
            }),
        );

  HttpClient._(Dio dio) : _dio = dio;

  Future<Response<T>> get<T extends Object?>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    final extraOptions = {isIdempotentOptionsKey: true};

    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(extra: extraOptions),
    );
  }

  Future<Response<T>> post<T extends Object?>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isIdempotent = false,
  }) async {
    final extraOptions = {isIdempotentOptionsKey: isIdempotent};

    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(extra: extraOptions),
    );
  }
}
