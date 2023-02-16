import 'package:charlatan/charlatan.dart';
import 'package:test/test.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import 'networking/fakes/fake_http_defaults.dart';

void main() {
  group('TestTrack', () {
    late Charlatan charlatan;
    late FakeTestTrackLogger logger;
    late AppVersionBuild appVersionBuild;
    late FakeAnalyticsProvider analyticsProvider;
    late DataStorageProvider dataStorageProvider;
    late AppVisitorConfig appVisitorConfig;
    late bool dataStorageInitialized;
    late TestTrack subject;

    Future<TestTrack> buildSubject() async {
      return TestTrack.initialize(
        baseUrl: 'http://localhost',
        appVersionBuild: appVersionBuild,
        dataStorageProvider: dataStorageProvider,
        analyticsProvider: analyticsProvider,
        customHttpAdapter: charlatan.toFakeHttpClientAdapter(),
        logger: logger,
      );
    }

    setUp(() async {
      dataStorageInitialized = false;

      analyticsProvider = FakeAnalyticsProvider();
      dataStorageProvider = FakeDataStorageProvider(onInitialize: () {
        dataStorageInitialized = true;
      });

      appVersionBuild = AppVersionBuildFactory.build();
      final visitor = VisitorFactory.build();
      appVisitorConfig = AppVisitorConfigFactory.build();

      logger = FakeTestTrackLogger.withoutNetworkLogging();
      charlatan = Charlatan()
        ..withDefaults()
        ..whenGetVisitorConfig(response: appVisitorConfig);

      // Pre-populate Visitor so call to GetVisitorConfig will be faked --
      // otherwise `test_track` generates a visitor with a random UUID
      // that we can't match against
      await dataStorageProvider.storeVisitor(visitor);
    });

    group('initialize', () {
      test('it calls initialize on DataStorageProvider', () async {
        subject = await buildSubject();
        expect(dataStorageInitialized, isTrue);
      });

      group('when fetchAppVisitorConfig succeeds', () {
        setUp(() async {
          subject = await buildSubject();
        });
        test('it stores the visitor and splitRegistry from the result',
            () async {
          expect(await dataStorageProvider.fetchVisitor(),
              appVisitorConfig.visitor);
          expect(await dataStorageProvider.fetchSplitRegistry(),
              appVisitorConfig.splitRegistry);
        });

        test('it calls identify on AnalyticsProvider', () async {
          expect(analyticsProvider.visitorsIdentified.length, 1);
          expect(
            analyticsProvider.identified(
              visitorId: appVisitorConfig.visitor.id,
            ),
            isTrue,
          );
        });
      });

      group('when fetchAppVisitorConfig fails', () {
        setUp(() async {
          charlatan.whenGetVisitorConfigFails();
        });

        test('it logs an info ', () async {
          subject = await buildSubject();

          expect(
            logger.infoLogs.single.message,
            'Failed to fetch app visitor config from server, using cached data',
          );

          expect(
            logger.infoLogs.single.error,
            'The request returned an invalid status code of 500.',
          );
        });

        test('it returns the cached visitor and split registry', () async {
          // Store a cached visitor and split registry to prevent TestTrack
          // from generating them for us
          await dataStorageProvider.storeVisitor(appVisitorConfig.visitor);
          await dataStorageProvider
              .storeSplitRegistry(appVisitorConfig.splitRegistry);

          subject = await buildSubject();

          expect(subject.visitor, appVisitorConfig.visitor);
          expect(subject.splitRegistry, appVisitorConfig.splitRegistry);
        });

        test('it does not call identify on AnalyticsProvider', () async {
          subject = await buildSubject();

          expect(analyticsProvider.visitorsIdentified, isEmpty);
        });
      });
    });

    group('createAssignmentOverrides', () {
      setUp(() async {
        charlatan
          ..whenPost(
            '/api/v2/visitors/${appVisitorConfig.visitor.id}/assignment_overrides',
            (request) => null,
          )
          // Configure the follow-up call that's made once assignments
          // have been overridden
          ..whenGetVisitorConfig(
            response: appVisitorConfig.copyWith(
              visitor: appVisitorConfig.visitor.copyWith(
                assignments: [
                  ...appVisitorConfig.visitor.assignments,
                  const Assignment(splitName: 'foo_enabled', variant: 'true'),
                ],
              ),
            ),
          );

        subject = await buildSubject();
      });

      test(
          'it calls createAssignmentOverrides and updates the AppVisitorConfig',
          () async {
        final override =
            const AssignmentOverride(splitName: 'foo_enabled', variant: 'true');

        final result =
            subject.createAssignmentOverrides(assignmentOverrides: [override]);
        await result;

        expect(result, completes);

        final visitor = await dataStorageProvider.fetchVisitor();
        final fooEnabledSplits = visitor!.assignments
            .where((a) => a.splitName == 'foo_enabled' && a.variant == 'true');

        expect(fooEnabledSplits, isNotEmpty);
      });
    });

    group('vary', () {
      setUp(() async {
        subject = await buildSubject();
      });

      group('when given a split name that exists in the split registry', () {
        test('it returns a Variant name', () {
          final split = appVisitorConfig.splits.first;
          final result = subject.vary(
            splitName: split.name,
            defaultVariant: '',
            context: '',
          );

          expect(result, isA<String>());
        });
      });

      group('when given a split name that does not exist in the split registy',
          () {
        test('it throws a SplitNotFoundException', () {
          final split = appVisitorConfig.splits.first;
          final fakeName = '${split.name}FAKE';

          expect(
            () => subject.vary(
              splitName: fakeName,
              defaultVariant: '',
              context: '',
            ),
            throwsA(isA<SplitNotFoundException>()),
          );
        });
      });
    });

    group('login', () {
      setUp(() async {
        charlatan.whenPost(
          '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
          (request) => appVisitorConfig
              .copyWith(
                visitor: appVisitorConfig.visitor.copyWith(id: 'post-login-id'),
                splits: SplitRegistry.empty().splits,
              )
              .toJson(),
        );
        subject = await buildSubject();
      });

      test('it calls linkIdentifier', () async {
        late bool linkIdentifierCalled;

        charlatan.whenPost(
          '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
          (request) {
            linkIdentifierCalled = true;
            return appVisitorConfig.toJson();
          },
        );

        await subject.login(identifierType: 'foo', value: '123');

        expect(linkIdentifierCalled, isTrue);
      });

      group('when linkIdentifier succeeds', () {
        test(
            'it stores the visitor and splitRegistry from the result in DataStorageProvider',
            () async {
          final visitorBeforeLogin = await dataStorageProvider.fetchVisitor();
          final splitRegistryBeforeLogin =
              await dataStorageProvider.fetchSplitRegistry();

          expect(visitorBeforeLogin?.id != 'post-login-id', isTrue);
          expect(splitRegistryBeforeLogin?.splits, isNotEmpty);

          await subject.login(identifierType: 'foo', value: '123');

          final visitorAfterLogin = await dataStorageProvider.fetchVisitor();
          final splitRegistryAfterLogin =
              await dataStorageProvider.fetchSplitRegistry();

          expect(visitorAfterLogin?.id, 'post-login-id');
          expect(splitRegistryAfterLogin?.splits, isEmpty);
        });
      });

      group('when linkIdentifier fails', () {
        test('it completes normally and logs an info', () async {
          charlatan.whenPost(
            '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
            (request) => null,
            statusCode: 500,
          );

          final result = subject.login(identifierType: 'foo', value: '123');

          await expectLater(
            result,
            completes,
          );

          expect(
            logger.infoLogs.single.message,
            'Failed to login user, continuing to use existing app visitor config',
          );

          expect(
            logger.infoLogs.single.error,
            'The request returned an invalid status code of 500.',
          );
        });
      });
    });

    group('logout', () {
      setUp(() async {
        subject = await buildSubject();
      });

      test('it resets the visitor in the DataStorageProvider', () async {
        final beforeLogoutVisitorId =
            await dataStorageProvider.fetchVisitor().then((value) => value?.id);

        expect(beforeLogoutVisitorId, appVisitorConfig.visitor.id);

        await subject.logout();

        final afterLogoutVisitorId =
            await dataStorageProvider.fetchVisitor().then((value) => value?.id);

        // Since a fresh visitor has a randomly-generated Id, just verify
        // that the Id no longer matches the previous visitor's
        expect(afterLogoutVisitorId != beforeLogoutVisitorId, isTrue);
      });

      test('it resets the local visitor field', () async {
        final beforeLogoutVisitorId = subject.visitor.id;
        expect(beforeLogoutVisitorId, appVisitorConfig.visitor.id);

        await subject.logout();

        final afterLogoutVisitorId = subject.visitor.id;
        // Since a fresh visitor has a randomly-generated Id, just verify
        // that the Id no longer matches the previous visitor's
        expect(afterLogoutVisitorId != beforeLogoutVisitorId, isTrue);
      });
    });

    group('ab', () {
      setUp(() async {
        charlatan.whenGetVisitorConfig(
            response: appVisitorConfig.copyWith(
          splits: [SplitFactory.build(isFeatureGate: true)],
        ));
        subject = await buildSubject();
      });

      group('when given a split name that does not exist in the split registy',
          () {
        test('it throws a SplitNotFoundException', () {
          final split = appVisitorConfig.splits.first;
          final fakeName = '${split.name}FAKE';

          expect(
            () => subject.ab(
              splitName: fakeName,
              context: 'none',
              trueVariant: 'true',
            ),
            throwsA(isA<SplitNotFoundException>()),
          );
        });
      });

      group('when trueVariant is supplied', () {
        late Split split;

        setUp(() async {
          split = const Split(
            name: 'fake-split',
            variants: [
              Variant(name: 'specialTrueVariant', weight: 0),
              Variant(name: 'true', weight: 100),
            ],
            isFeatureGate: true,
          );

          charlatan.whenGetVisitorConfig(
            response: appVisitorConfig.copyWith(
              splits: [split],
            ),
          );

          subject = await buildSubject();
        });

        test('it is utilized in performing the Ab', () async {
          final result = subject.ab(
            splitName: split.name,
            context: 'none',
            trueVariant: 'specialTrueVariant',
          );

          // Because an Ab is only true when the variant returned
          // by RunVary equals the `trueVariant`, we expect
          // false to be returned even though `true` is set to 100,
          // because `true` != `specialTrueVariant`
          // This proves that the nullable `trueVariant` parameter
          // was respected and `trueVariant` did not default to `true`
          expect(result, false);
        });
      });
    });
  });
}
