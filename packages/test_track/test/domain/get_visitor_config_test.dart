import 'package:charlatan/charlatan.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/get_visitor_config.dart';
import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../networking/fakes/fake_http_client.dart';
import '../networking/fakes/fake_http_defaults.dart';

void main() {
  group('GetVisitorConfig', () {
    group('call(visitorId:)', () {
      late HttpClient client;
      late DataStorageProvider dataStorageProvider;
      late FakeAnalyticsProvider analyticsProvider;
      late GetVisitorConfig subject;
      late AppVisitorConfig appVisitorConfig;
      final visitorId = VisitorFactory.build().id;
      final appVersionBuild = AppVersionBuildFactory.build();

      setUp(() async {
        appVisitorConfig = AppVisitorConfigFactory.build();
        final charlatan = Charlatan()
          ..withDefaults()
          ..whenGetVisitorConfig(
            response: appVisitorConfig,
          );
        client = FakeHttpClient(charlatan);
        dataStorageProvider = FakeDataStorageProvider();
        analyticsProvider = FakeAnalyticsProvider();
        subject = GetVisitorConfig(
          client: client,
          analyticsProvider: analyticsProvider,
          dataStorageProvider: dataStorageProvider,
        );
      });

      test(
          'it makes a GET request to the correct url and returns an AppVisitorConfig',
          () async {
        final result = await subject.call(
          visitorId: visitorId,
          appVersionBuild: appVersionBuild,
        );
        expect(result, appVisitorConfig);
      });

      test('it stores new visitor and split registry in data storage',
          () async {
        final initialVisitor = Visitor.build();
        await dataStorageProvider.storeVisitor(initialVisitor);
        await dataStorageProvider.storeSplitRegistry(SplitRegistry.empty());
        await subject.call(
          visitorId: visitorId,
          appVersionBuild: appVersionBuild,
        );
        final storedVisitor = await dataStorageProvider.fetchVisitor();
        final storedSplitRegistry =
            await dataStorageProvider.fetchSplitRegistry();
        expect(initialVisitor.id == storedVisitor!.id, isFalse);
        expect(storedSplitRegistry!.splits, isNotEmpty);
      });

      test('it invokes identify on the analytics provider ', () async {
        expect(analyticsProvider.identifyInvocations, isEmpty);
        await subject.call(
          visitorId: visitorId,
          appVersionBuild: appVersionBuild,
        );
        expect(analyticsProvider.identifyInvocations.length, 1);
      });
    });
  });
}
