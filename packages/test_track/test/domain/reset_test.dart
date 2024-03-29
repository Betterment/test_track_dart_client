import 'package:test/test.dart';
import 'package:test_track/src/domain/reset.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('Reset', () {
    group('call()', () {
      late Reset subject;
      late DataStorageProvider storageProvider;
      late FakeAnalyticsProvider analyticsProvider;

      setUp(() async {
        storageProvider = FakeDataStorageProvider();
        analyticsProvider = FakeAnalyticsProvider();
        subject = Reset(
          dataStorageProvider: storageProvider,
          analyticsProvider: analyticsProvider,
        );
      });

      test('it stores a fresh visitor in storage', () async {
        await storageProvider.storeVisitor(
          VisitorFactory.build().withId('my-fake-id'),
        );
        final visitorBeforeLogout = await storageProvider.fetchVisitor();
        expect(visitorBeforeLogout?.id, 'my-fake-id');

        final visitorAfterLogout = await subject.call();
        expect(visitorAfterLogout != visitorBeforeLogout, isTrue);

        final storedVisitor = await storageProvider.fetchVisitor();
        expect(storedVisitor?.id, visitorAfterLogout.id);
      });

      test('it stores the login state as false', () async {
        await storageProvider.storeLoginState(true);
        final loginStateBeforeLogout = await storageProvider.fetchLoginState();
        expect(loginStateBeforeLogout, isTrue);

        await subject.call();

        final loginStateAfterLogout = await storageProvider.fetchLoginState();
        expect(loginStateAfterLogout, isFalse);
      });

      test('it notifies analytics provider of new visitor', () async {
        expect(analyticsProvider.visitorsIdentified, isEmpty);

        final newVisitor = await subject.call();

        expect(analyticsProvider.visitorsIdentified.single, newVisitor.id);
      });
    });
  });
}
