import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:test_track/src/networking/interceptors/retry_options.dart';

void main() {
  group('RetryOptions', () {
    group('shouldRetry', () {
      group('when retries > 0 and the request is idempotent and the error type is CONNECT_TIMEOUT', () {
        test('it returns true', () {
          final subject = RetryOptions(attempts: 2);
          final error = DioError(
            type: DioErrorType.connectTimeout,
            requestOptions: RequestOptions(path: ''),
          );

          expect(subject.shouldRetry(error, isIdempotent: true), true);
        });
      });

      group('when retries > 0 and the error type is RECEIVE_TIMEOUT and the request is idempotent', () {
        test('it returns true', () {
          final subject = RetryOptions(attempts: 2);
          final error = DioError(
            type: DioErrorType.receiveTimeout,
            requestOptions: RequestOptions(path: ''),
          );

          expect(subject.shouldRetry(error, isIdempotent: false), false);
        });
      });

      group('when retries >   and the error type is RECEIVE_TIMEOUT and the request is not idempotent', () {
        test('it returns true', () {
          final subject = RetryOptions(attempts: 2);
          final error = DioError(
            type: DioErrorType.receiveTimeout,
            requestOptions: RequestOptions(path: ''),
          );

          expect(subject.shouldRetry(error, isIdempotent: true), true);
        });
      });

      group('when retries is equal to 0', () {
        test('it returns false', () {
          final subject = RetryOptions(attempts: 0);
          final error = DioError(
            type: DioErrorType.connectTimeout,
            requestOptions: RequestOptions(path: ''),
          );

          expect(subject.shouldRetry(error, isIdempotent: true), false);
        });
      });

      group('when error type is not CONNECT_TIMEOUT or RECEIVE_TIMEOUT', () {
        test('it returns false', () {
          final subject = RetryOptions(attempts: 2);
          final error = DioError(
            type: DioErrorType.cancel,
            requestOptions: RequestOptions(path: ''),
          );

          expect(subject.shouldRetry(error, isIdempotent: true), false);
        });
      });
    });

    group('toExtraOptions', () {
      test('it returns a map with retry options located at retry_request key', () {
        final subject = RetryOptions(attempts: 2);

        expect(subject.toExtraOptions(), {'retry_request': subject});
      });
    });
  });
}
