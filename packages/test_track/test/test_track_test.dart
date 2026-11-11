import 'dart:async';

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

    Future<TestTrack> buildSubject({
      HttpTimeouts? defaultTimeouts,
      HttpTimeouts? initializeTimeouts,
    }) async {
      return TestTrack.initialize(
        baseUrl: 'http://localhost',
        appVersionBuild: appVersionBuild,
        dataStorageProvider: dataStorageProvider,
        analyticsProvider: analyticsProvider,
        customHttpAdapter: charlatan.toFakeHttpClientAdapter(),
        logger: logger,
        defaultTimeouts: defaultTimeouts,
        initializeTimeouts: initializeTimeouts,
      );
    }

    const configPath =
        '/api/v4/apps/{appName}/versions/{version}/builds/{buildTimestamp}/visitors/{visitorId}/config';
    const shortTimeout = HttpTimeouts(call: Duration(milliseconds: 100));
    Future<CharlatanHttpResponse> never(Object? _) =>
        Completer<CharlatanHttpResponse>().future;

    setUp(() async {
      dataStorageInitialized = false;

      analyticsProvider = FakeAnalyticsProvider();
      dataStorageProvider = FakeDataStorageProvider(
        onInitialize: () {
          dataStorageInitialized = true;
        },
      );

      appVersionBuild = AppVersionBuildFactory.build();
      final visitor = VisitorFactory.build();
      appVisitorConfig = AppVisitorConfigFactory.build();

      logger = FakeTestTrackLogger.withoutNetworkLogging();
      charlatan =
          Charlatan()
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
        test(
          'it stores the visitor and splitRegistry from the result',
          () async {
            expect(
              await dataStorageProvider.fetchVisitor(),
              appVisitorConfig.visitor,
            );
            expect(
              await dataStorageProvider.fetchSplitRegistry(),
              appVisitorConfig.splitRegistry,
            );
          },
        );

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
            logger.infoLogs.single.error.toString(),
            contains('ServerError'),
          );
        });

        test('it returns the cached visitor and split registry', () async {
          // Store a cached visitor and split registry to prevent TestTrack
          // from generating them for us
          await dataStorageProvider.storeVisitor(appVisitorConfig.visitor);
          await dataStorageProvider.storeSplitRegistry(
            appVisitorConfig.splitRegistry,
          );

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

    group('initialize timeouts', () {
      test(
        'it applies defaultTimeouts to the startup fetch when initializeTimeouts is null',
        () async {
          charlatan.whenGet(configPath, never);

          subject = await buildSubject(
            defaultTimeouts: shortTimeout,
          ).timeout(const Duration(seconds: 1));

          expect(
            subject.visitor.id,
            (await dataStorageProvider.fetchVisitor())!.id,
          );
          expect(subject.visitor.id, isNot(appVisitorConfig.visitor.id));
        },
      );

      test(
        'it logs the TestTrackTimeoutException when the startup fetch times out',
        () async {
          charlatan.whenGet(configPath, never);

          await buildSubject(
            initializeTimeouts: shortTimeout,
          ).timeout(const Duration(seconds: 1));

          expect(
            logger.infoLogs.single.error,
            isA<TestTrackTimeoutException>(),
          );
        },
      );

      test(
        'initializeTimeouts overrides defaultTimeouts for the startup fetch',
        () async {
          charlatan.whenGet(configPath, never);

          subject = await buildSubject(
            defaultTimeouts: const HttpTimeouts(call: Duration(seconds: 10)),
            initializeTimeouts: shortTimeout,
          ).timeout(const Duration(seconds: 1));

          expect(
            subject.visitor.id,
            (await dataStorageProvider.fetchVisitor())!.id,
          );
          expect(subject.visitor.id, isNot(appVisitorConfig.visitor.id));
        },
      );
    });

    group('createAssignmentOverrides', () {
      setUp(() async {
        charlatan
          ..whenPost(
            '/api/v2/visitors/${appVisitorConfig.visitor.id}/assignment_overrides',
            (request) => CharlatanHttpResponse(statusCode: 204),
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
          final override = const AssignmentOverride(
            splitName: 'foo_enabled',
            variant: 'true',
          );

          final result = subject.createAssignmentOverrides(
            assignmentOverrides: [override],
          );
          await result;

          expect(result, completes);

          final visitor = await dataStorageProvider.fetchVisitor();
          final fooEnabledSplits = visitor!.assignments.where(
            (a) => a.splitName == 'foo_enabled' && a.variant == 'true',
          );

          expect(fooEnabledSplits, isNotEmpty);
        },
      );
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

      group(
        'when given a split name that does not exist in the split registry',
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
        },
      );
    });

    group('overrideVisitorId', () {
      test('it fetches visitor config', () async {
        final visitorId = 'overridden-id';
        final config = AppVisitorConfigFactory.build().copyWith(
          visitor: VisitorFactory.build().copyWith(id: visitorId),
        );
        charlatan.whenGetVisitorConfig(response: config);

        final subject = await buildSubject();
        await subject.overrideVisitorId(visitorId);

        final fetchedVisitorId = (await dataStorageProvider.fetchVisitor())!.id;
        expect(fetchedVisitorId, visitorId);

        final newVisitorId = subject.visitor.id;
        expect(newVisitorId, visitorId);
      });

      test(
        'it throws TestTrackTimeoutException when the call times out',
        () async {
          final subject = await buildSubject();
          charlatan.whenGet(configPath, never);

          await expectLater(
            subject.overrideVisitorId('overridden-id', timeouts: shortTimeout),
            throwsA(isA<TestTrackTimeoutException>()),
          );
        },
      );
    });

    group('login', () {
      setUp(() async {
        charlatan.whenPost(
          '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
          (request) => CharlatanHttpResponse(
            body:
                appVisitorConfig
                    .copyWith(
                      visitor: appVisitorConfig.visitor.copyWith(
                        id: 'post-login-id',
                      ),
                      splits: SplitRegistry.empty().splits,
                    )
                    .toMap(),
          ),
        );
        subject = await buildSubject();
      });

      test('it calls linkIdentifier', () async {
        late bool linkIdentifierCalled;

        charlatan.whenPost(
          '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
          (request) {
            linkIdentifierCalled = true;
            return CharlatanHttpResponse(body: appVisitorConfig.toJson());
          },
        );

        await subject.login(identifierType: 'foo', value: '123');

        expect(linkIdentifierCalled, isTrue);
      });

      test('it returns TestTrackLoginSuccess when linking succeeds', () async {
        final result = await subject.login(identifierType: 'foo', value: '123');

        expect(result, isA<TestTrackLoginSuccess>());
      });

      test('it returns a TestTrackLoginFailure for a server error', () async {
        charlatan.whenPost(
          '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
          (request) => CharlatanHttpResponse(statusCode: 500),
        );

        final result = await subject.login(identifierType: 'foo', value: '123');

        expect(result, isA<TestTrackLoginFailure>());
        expect((result as TestTrackLoginFailure).isTimeout, isFalse);
        expect(
          logger.infoLogs.single.message,
          'Failed to login user, continuing to use existing app visitor config',
        );
        expect(
          logger.infoLogs.single.error.toString(),
          contains('ServerError'),
        );
      });

      test('it returns a timeout failure, then a later login succeeds', () async {
        const identifierPath =
            '/api/v4/apps/{appName}/versions/{version}/builds/{buildTimestamp}/identifier';
        final visitorIdBefore = subject.visitor.id;
        final splitRegistryBefore =
            await dataStorageProvider.fetchSplitRegistry();
        charlatan.whenPost(identifierPath, never);

        final first = await subject.login(
          identifierType: 'foo',
          value: '123',
          timeouts: shortTimeout,
        );

        expect((first as TestTrackLoginFailure).isTimeout, isTrue);
        expect(subject.visitor.id, visitorIdBefore);
        expect(splitRegistryBefore?.splits, isNotEmpty);
        expect(
          (await dataStorageProvider.fetchSplitRegistry())?.splits,
          splitRegistryBefore?.splits,
        );

        charlatan.whenPost(
          identifierPath,
          (request) => CharlatanHttpResponse(
            body:
                appVisitorConfig
                    .copyWith(
                      visitor: appVisitorConfig.visitor.copyWith(
                        id: 'post-login-id',
                      ),
                      splits: SplitRegistry.empty().splits,
                    )
                    .toMap(),
          ),
        );
        final second = await subject.login(identifierType: 'foo', value: '123');

        expect(second, isA<TestTrackLoginSuccess>());
        expect(subject.visitor.id, 'post-login-id');
        expect(
          (await dataStorageProvider.fetchSplitRegistry())?.splits,
          isEmpty,
        );
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
          },
        );
      });
    });

    group('reset', () {
      setUp(() async {
        subject = await buildSubject();
      });

      test('it resets the visitor in the DataStorageProvider', () async {
        final beforeLogoutVisitorId = await dataStorageProvider
            .fetchVisitor()
            .then((value) => value?.id);

        expect(beforeLogoutVisitorId, appVisitorConfig.visitor.id);

        await subject.reset();

        final afterLogoutVisitorId = await dataStorageProvider
            .fetchVisitor()
            .then((value) => value?.id);

        // Since a fresh visitor has a randomly-generated Id, just verify
        // that the Id no longer matches the previous visitor's
        expect(afterLogoutVisitorId != beforeLogoutVisitorId, isTrue);
      });

      test('it resets the local visitor field', () async {
        final beforeLogoutVisitorId = subject.visitor.id;
        expect(beforeLogoutVisitorId, appVisitorConfig.visitor.id);

        await subject.reset();

        final afterLogoutVisitorId = subject.visitor.id;
        // Since a fresh visitor has a randomly-generated Id, just verify
        // that the Id no longer matches the previous visitor's
        expect(afterLogoutVisitorId != beforeLogoutVisitorId, isTrue);
      });
    });

    group('logout', () {
      setUp(() async {
        subject = await buildSubject();
      });

      test('it sets login state to false in DataStorageProvider', () async {
        await dataStorageProvider.storeLoginState(true);
        final isLoggedInBefore = await dataStorageProvider.fetchLoginState();

        expect(isLoggedInBefore, isTrue);

        await subject.logout();

        final isLoggedInAfter = await dataStorageProvider.fetchLoginState();
        expect(isLoggedInAfter, isFalse);
      });
    });

    group('ab', () {
      setUp(() async {
        charlatan.whenGetVisitorConfig(
          response: appVisitorConfig.copyWith(
            splits: [SplitFactory.build(isFeatureGate: true)],
          ),
        );
        subject = await buildSubject();
      });

      group(
        'when given a split name that does not exist in the split registry',
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
        },
      );

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
            response: appVisitorConfig.copyWith(splits: [split]),
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
