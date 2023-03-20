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
        final logger = FakeTestTrackLogger.withoutNetworkLogging();

        final subject = OverrideVisitorId(
          getVisitorConfig: getVisitorConfig,
          dataStorageProvider: storageProvider,
          logger: logger,
        );

        expect(await storageProvider.fetchLoginState(), isFalse);
        await subject.call(
          visitorId: VisitorFactory.build().id,
          appVersionBuild: AppVersionBuildFactory.build(),
        );
        expect(wasGetVisitorConfigCalled, isTrue);
      });
    });

    group('when the user is logged in', () {
      test('it ignores the request', () async {
        bool wasGetVisitorConfigCalled = false;
        final getVisitorConfig = _FakeGetVisitorConfig(
          () => wasGetVisitorConfigCalled = true,
        );
        final logger = FakeTestTrackLogger.withoutNetworkLogging();
        final storageProvider = FakeDataStorageProvider();
        await storageProvider.storeLoginState(true);

        final subject = OverrideVisitorId(
          getVisitorConfig: getVisitorConfig,
          dataStorageProvider: storageProvider,
          logger: logger,
        );

        expect(await storageProvider.fetchLoginState(), isTrue);
        final config = await subject.call(
          visitorId: VisitorFactory.build().id,
          appVersionBuild: AppVersionBuildFactory.build(),
        );

        expect(wasGetVisitorConfigCalled, isFalse);
        expect(config, isNull);
        expect(
          logger.infoLogs.single.message,
          contains('Attempt to override visitor id ignored'),
        );
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
