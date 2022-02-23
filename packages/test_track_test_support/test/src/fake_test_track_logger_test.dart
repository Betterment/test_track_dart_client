import 'package:test/test.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../helpers/matchers.dart';

void main() {
  group('FakeTestTrackLogger', () {
    late FakeTestTrackLogger subject;

    setUp(() {
      subject = FakeTestTrackLogger.withoutNetworkLogging();
    });

    test('it tracks debug logs', () {
      subject.debug(
        'test',
        error: 'testError',
        stackTrace: StackTrace.empty,
      );

      expect(
        subject.debugLogs,
        onlyContains(
          [
            LogEvent(
              'test',
              'testError',
              StackTrace.empty,
            ),
          ],
        ),
      );

      expect(subject.noInfoLogs, isTrue);
      expect(subject.noErrorLogs, isTrue);
    });

    test('it tracks info logs', () {
      subject.info(
        'test',
        error: 'testError',
        stackTrace: StackTrace.empty,
      );

      expect(
        subject.infoLogs,
        onlyContains(
          [
            LogEvent(
              'test',
              'testError',
              StackTrace.empty,
            ),
          ],
        ),
      );

      expect(subject.noDebugLogs, isTrue);
      expect(subject.noErrorLogs, isTrue);
    });

    test('it tracks error logs', () {
      subject.error(
        'test',
        error: 'testError',
        stackTrace: StackTrace.empty,
      );

      expect(
        subject.errorLogs,
        onlyContains(
          [
            LogEvent(
              'test',
              'testError',
              StackTrace.empty,
            ),
          ],
        ),
      );

      expect(subject.noDebugLogs, isTrue);
      expect(subject.noInfoLogs, isTrue);
    });

    group('noDebugLogs', () {
      test('it returns true if no debug logs were fired', () {
        expect(
          subject.noDebugLogs,
          isTrue,
        );
      });

      test('it returns false if any debug logs were fired', () {
        subject.debug('test');

        expect(
          subject.noDebugLogs,
          isFalse,
        );
      });
    });

    group('noInfoLogs', () {
      test('it returns true if no info logs were fired', () {
        expect(
          subject.noInfoLogs,
          isTrue,
        );
      });

      test('it returns false if any info logs were fired', () {
        subject.info('test');

        expect(
          subject.noInfoLogs,
          isFalse,
        );
      });
    });

    group('noErrorLogs', () {
      test('it returns true if no error logs were fired', () {
        expect(
          subject.noErrorLogs,
          isTrue,
        );
      });

      test('it returns false if any error logs were fired', () {
        subject.error('test');

        expect(
          subject.noErrorLogs,
          isFalse,
        );
      });
    });
  });
}
