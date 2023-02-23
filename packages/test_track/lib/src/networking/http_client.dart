import 'package:dio/dio.dart';
import 'package:test_track/src/helpers/extensions.dart';
import 'package:test_track/src/logging/logging.dart';
import 'package:test_track/src/networking/interceptors/logging_interceptor.dart';
import 'package:test_track/src/networking/interceptors/required_headers_interceptor.dart';
import 'package:test_track/src/networking/interceptors/retry_interceptor.dart';

/// {@template http_client}
/// [HttpClient] provides production-ready network access using [Dio].
/// {@endtemplate}
class HttpClient {
  // ignore: public_member_api_docs
  static const isIdempotentOptionsKey = 'is_idempotent';
  final Dio _dio;

  // ignore: public_member_api_docs
  String get baseUrl => _dio.options.baseUrl;

  /// {@macro http_client}
  HttpClient({
    required String baseUrl,
    required TestTrackLogger logger,
    HttpClientAdapter? customAdapter,
  }) : this._(
          Dio()
            ..options.baseUrl = baseUrl
            ..options.connectTimeout = const Duration(seconds: 10)
            ..options.receiveTimeout = const Duration(seconds: 20)
            ..map((dio) {
              final interceptors = [
                RequiredHeadersInterceptor(),
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

  /// Sends a GET request for the provided [path]
  /// and [queryParameters]. Failed requests will
  /// be retried according to the [RetryInterceptor]
  /// configuration
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

  /// Sends a POST request for the provided [path],
  /// [data], and [queryParameters]. If the request
  /// being made is idempotent, [isIdempotent] can
  /// be passed as `true` and failed requests will
  /// be retried according to the [RetryInterceptor]
  /// configuration
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
