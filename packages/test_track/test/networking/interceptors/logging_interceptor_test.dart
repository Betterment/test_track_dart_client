import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:test_track/src/logging/test_track_logger.dart';
import 'package:test_track/src/networking/interceptors/logging_interceptor.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../fakes/fake_error_interceptor_handler.dart';

class MockRequestOptions extends Mock implements RequestOptions {}

void main() {
  group('LoggingInterceptor', () {
    LoggingInterceptor buildSubject({
      required TestTrackLogger logger,
    }) {
      return LoggingInterceptor(logger: logger);
    }

    group('onRequest', () {
      test('when network logging is enabled, it logs to loggingService', () async {
        final logger = FakeTestTrackLogger(
          shouldEnableNetworkLogging: true,
        );
        final subject = buildSubject(logger: logger);
        final requestOptions = MockRequestOptions();
        when(() => requestOptions.method).thenReturn('');
        when(() => requestOptions.headers).thenReturn(<String, String>{'beep': 'bop'});
        when(() => requestOptions.uri).thenReturn(Uri.base);

        subject.onRequest(requestOptions, RequestInterceptorHandler());

        final mainLogEvent = logger.debugLogs.first;
        final headersLogEvent = logger.debugLogs.last;
        expect(mainLogEvent.message, contains('TestTrack HttpClient - ⬆️'));
        expect(headersLogEvent.message, 'headers: {beep: bop}');
      });

      test('when network logging is not enabled, it does not log to loggingService', () async {
        final logger = FakeTestTrackLogger.withoutNetworkLogging();
        final subject = buildSubject(logger: logger);

        subject.onRequest(MockRequestOptions(), RequestInterceptorHandler());

        expect(logger.noDebugLogs, isTrue);
      });
    });

    group('onError', () {
      test('when network logging is enabled, it logs to loggingService', () async {
        final requestOptions = MockRequestOptions();
        when(() => requestOptions.uri).thenReturn(Uri.base);
        final logger = FakeTestTrackLogger(shouldEnableNetworkLogging: true);
        final subject = buildSubject(logger: logger);

        subject.onError(
          DioException(requestOptions: requestOptions),
          FakeErrorInterceptorHandler(),
        );

        expect(logger.debugLogs.length, 2);
      });

      test('when network logging is not enabled, it does not log to loggingService', () async {
        final requestOptions = MockRequestOptions();
        when(() => requestOptions.uri).thenReturn(Uri.base);
        final logger = FakeTestTrackLogger.withoutNetworkLogging();
        final subject = buildSubject(logger: logger);

        subject.onError(
          DioException(requestOptions: requestOptions),
          FakeErrorInterceptorHandler(),
        );

        expect(logger.noDebugLogs, isTrue);
      });
    });

    group('onResponse', () {
      test('when network logging is enabled, it logs to loggingService', () async {
        final requestOptions = MockRequestOptions();
        when(() => requestOptions.uri).thenReturn(Uri.base);
        final logger = FakeTestTrackLogger(shouldEnableNetworkLogging: true);
        final subject = buildSubject(logger: logger);

        subject.onResponse(
          Response<dynamic>(requestOptions: requestOptions),
          ResponseInterceptorHandler(),
        );

        expect(logger.debugLogs.length, 1);
      });

      test('when network logging is not enabled, it does not log to loggingService', () async {
        final requestOptions = MockRequestOptions();
        when(() => requestOptions.uri).thenReturn(Uri.base);
        final logger = FakeTestTrackLogger.withoutNetworkLogging();
        final subject = buildSubject(logger: logger);

        subject.onResponse(
          Response<dynamic>(requestOptions: requestOptions),
          ResponseInterceptorHandler(),
        );

        expect(logger.noDebugLogs, isTrue);
      });
    });
  });
}
