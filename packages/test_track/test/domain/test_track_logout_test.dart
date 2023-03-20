import 'package:test/test.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('Logout', () {
    group('call()', () {
      late Logout subject;
      late DataStorageProvider storageProvider;

      setUp(() async {
        storageProvider = FakeDataStorageProvider();
        subject = Logout(dataStorageProvider: storageProvider);
      });

      test('it stores the login state as false', () async {
        await storageProvider.storeLoginState(true);
        final loginStateBeforeLogout = await storageProvider.fetchLoginState();
        expect(loginStateBeforeLogout, isTrue);

        await subject.call();

        final loginStateAfterLogout = await storageProvider.fetchLoginState();
        expect(loginStateAfterLogout, isFalse);
      });
    });
  });
}
