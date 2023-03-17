import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/src/helpers/typedefs.dart';
import 'package:test_track/src/models/app_visitor_config.dart';
import 'package:test_track/src/models/app_version_build.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('OverrideVisitorId', () {
    group('when the user is not logged in', () {
      test('it invokes GetVisitorConfig', () async {
        late final bool wasGetVisitorConfigCalled;
        final getVisitorConfig = _FakeGetVisitorConfig(
          () => wasGetVisitorConfigCalled = true,
        );
        final storageProvider = FakeDataStorageProvider();

        final subject = OverrideVisitorId(
          getVisitorConfig: getVisitorConfig,
          dataStorageProvider: storageProvider,
        );

        expect(await storageProvider.fetchLogInState(), isFalse);
        await subject.call(
          visitorId: VisitorFactory.build().id,
          appVersionBuild: AppVersionBuildFactory.build(),
        );
        expect(wasGetVisitorConfigCalled, isTrue);
      });
    });

    group('when the user is logged in', () {
      test('it throws a TestTrackInvalidVisitorOverrideException', () async {
        bool wasGetVisitorConfigCalled = false;
        final getVisitorConfig = _FakeGetVisitorConfig(
          () => wasGetVisitorConfigCalled = true,
        );
        final storageProvider = FakeDataStorageProvider();
        await storageProvider.storeLoginState(true);

        final subject = OverrideVisitorId(
          getVisitorConfig: getVisitorConfig,
          dataStorageProvider: storageProvider,
        );

        expect(await storageProvider.fetchLogInState(), isTrue);
        final result = subject.call(
          visitorId: VisitorFactory.build().id,
          appVersionBuild: AppVersionBuildFactory.build(),
        );

        expectLater(
          result,
          throwsA(isA<TestTrackInvalidVisitorOverrideException>()),
        );
        expect(wasGetVisitorConfigCalled, isFalse);
      });
    });
  });
}

class _FakeGetVisitorConfig implements GetVisitorConfig {
  final VoidCallback onCall;

  _FakeGetVisitorConfig(this.onCall);

  @override
  Future<AppVisitorConfig> call({
    required String visitorId,
    required AppVersionBuild appVersionBuild,
  }) async {
    onCall();
    return AppVisitorConfigFactory.build();
  }
}
