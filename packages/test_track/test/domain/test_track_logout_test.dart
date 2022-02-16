import 'package:test/test.dart';
import 'package:test_track/src/domain/test_track_logout.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('Logout', () {
    group('call()', () {
      late Logout subject;
      late DataStorageProvider storageProvider;
      late FakeAnalyticsProvider analyticsProvider;

      setUp(() async {
        storageProvider = FakeDataStorageProvider();
        analyticsProvider = FakeAnalyticsProvider();
        subject = Logout(
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

      test('it notifies analytics provider of new visitor', () async {
        expect(analyticsProvider.identifyInvocations, isEmpty);

        final newVisitor = await subject.call();

        expect(analyticsProvider.identifyInvocations.single, newVisitor.id);
      });
    });
  });
}
