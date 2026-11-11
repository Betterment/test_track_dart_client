import 'dart:async';

import 'package:charlatan/charlatan.dart';
import 'package:sturdy_http/sturdy_http.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/get_visitor_config.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../networking/fakes/fake_http_client.dart';
import '../networking/fakes/fake_http_defaults.dart';

void main() {
  group('GetVisitorConfig', () {
    group('call(visitorId:)', () {
      late SturdyHttp client;
      late DataStorageProvider dataStorageProvider;
      late FakeAnalyticsProvider analyticsProvider;
      late GetVisitorConfig subject;
      late AppVisitorConfig appVisitorConfig;
      final visitorId = VisitorFactory.build().id;
      final appVersionBuild = AppVersionBuildFactory.build();

      setUp(() async {
        appVisitorConfig = AppVisitorConfigFactory.build();
        final charlatan =
            Charlatan()
              ..withDefaults()
              ..whenGetVisitorConfig(response: appVisitorConfig);
        client = FakeSturdyHttp(charlatan);
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
        },
      );

      test(
        'it stores new visitor and split registry in data storage',
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
        },
      );

      test('it invokes identify on the analytics provider ', () async {
        expect(analyticsProvider.visitorsIdentified, isEmpty);
        await subject.call(
          visitorId: visitorId,
          appVersionBuild: appVersionBuild,
        );
        expect(analyticsProvider.visitorsIdentified.length, 1);
      });

      group('when a call timeout is set', () {
        const configPath =
            '/api/v4/apps/{appName}/versions/{version}/builds/{buildTimestamp}/visitors/{visitorId}/config';
        final timeouts = HttpTimeouts(call: const Duration(milliseconds: 100));

        test(
          'it throws TestTrackTimeoutException and stores nothing',
          () async {
            final charlatan =
                Charlatan()..whenGet(
                  configPath,
                  (_) => Completer<CharlatanHttpResponse>().future,
                );
            final dataStorageProvider = FakeDataStorageProvider();
            final subject = GetVisitorConfig(
              client: FakeSturdyHttp(charlatan),
              analyticsProvider: FakeAnalyticsProvider(),
              dataStorageProvider: dataStorageProvider,
            );

            await expectLater(
              subject.call(
                visitorId: visitorId,
                appVersionBuild: appVersionBuild,
                timeouts: timeouts,
              ),
              throwsA(isA<TestTrackTimeoutException>()),
            );
            expect(await dataStorageProvider.fetchVisitor(), isNull);
          },
        );

        test('it sets the request timeouts', () async {
          Object? callDeadline;
          final charlatan =
              Charlatan()..whenGet(configPath, (request) {
                callDeadline =
                    request.requestOptions.extra[callDeadlineExtraKey];
                return CharlatanHttpResponse(body: appVisitorConfig.toMap());
              });
          final subject = GetVisitorConfig(
            client: FakeSturdyHttp(charlatan),
            analyticsProvider: FakeAnalyticsProvider(),
            dataStorageProvider: FakeDataStorageProvider(),
          );

          await subject.call(
            visitorId: visitorId,
            appVersionBuild: appVersionBuild,
            timeouts: timeouts,
          );

          expect(callDeadline, isA<DateTime>());
        });
      });
    });
  });
}
