import 'package:charlatan/charlatan.dart';
import 'package:sturdy_http/sturdy_http.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/test_track_login.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../networking/fakes/fake_http_client.dart';

void main() {
  group('Login', () {
    group('call(identifier:, visitorId:, appVersionBuild:)', () {
      late Charlatan charlatan;
      late SturdyHttp client;
      late DataStorageProvider dataStorageProvider;
      late FakeAnalyticsProvider analyticsProvider;
      late Login subject;

      final visitorId = VisitorFactory.build().id;
      final identifier =
          const Identifier(identifierType: 'foo_id', value: '123');
      final appVersionBuild = AppVersionBuildFactory.build();

      setUp(() async {
        charlatan = Charlatan();
        client = FakeSturdyHttp(charlatan);
        dataStorageProvider = FakeDataStorageProvider();
        analyticsProvider = FakeAnalyticsProvider();
        subject = Login(
          httpClient: client,
          dataStorageProvider: dataStorageProvider,
          analyticsProvider: analyticsProvider,
        );
      });

      group('when linking identifier succeeds', () {
        late String? identifierTypeFromRequest;
        late String? identifierValueFromRequest;
        late String? visitorIdFromRequest;
        late bool isIdempotent;

        setUp(() async {
          final appVisitorConfig = AppVisitorConfigFactory.build();

          charlatan.whenPost(
            '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
            (request) {
              final data = request.body as Map<String, Object?>?;
              identifierTypeFromRequest = data?['identifier_type'] as String?;
              identifierValueFromRequest = data?['value'] as String?;
              visitorIdFromRequest = data?['visitor_id'] as String?;
              isIdempotent =
                  request.requestOptions.extra['is_idempotent'] as bool;
              return CharlatanHttpResponse(body: appVisitorConfig.toJson());
            },
          );
        });

        test(
            'it makes a POST request to the correct url with the correct body and returns an AppVisitorConfig',
            () async {
          final appVisitorConfig = await subject.call(
            identifier: identifier,
            visitorId: visitorId,
            appVersionBuild: appVersionBuild,
          );
          expect(identifierValueFromRequest, identifier.value);
          expect(identifierTypeFromRequest, identifier.identifierType);
          expect(visitorIdFromRequest, visitorId);
          expect(isIdempotent, isTrue);
          expect(appVisitorConfig, isA<AppVisitorConfig>());
        });

        test('it stores the visitor from the returned AppVisitorConfig',
            () async {
          final visitorBefore = await dataStorageProvider.fetchVisitor();
          expect(visitorBefore, isNull);

          await subject.call(
            identifier: identifier,
            visitorId: visitorId,
            appVersionBuild: appVersionBuild,
          );

          final visitorAfter = await dataStorageProvider.fetchVisitor();
          expect(visitorAfter, isNotNull);
        });

        test('it stores the splitRegistry from the returned AppVisitorConfig',
            () async {
          final splitRegistryBefore =
              await dataStorageProvider.fetchSplitRegistry();
          expect(splitRegistryBefore, isNull);

          await subject.call(
            identifier: identifier,
            visitorId: visitorId,
            appVersionBuild: appVersionBuild,
          );

          final splitRegistryAfter =
              await dataStorageProvider.fetchSplitRegistry();
          expect(splitRegistryAfter, isNotNull);
        });

        test('it stores the login state as true', () async {
          final loginStateBefore = await dataStorageProvider.fetchLoginState();
          expect(loginStateBefore, isFalse);

          await subject.call(
            identifier: identifier,
            visitorId: visitorId,
            appVersionBuild: appVersionBuild,
          );

          final loginStateAfter = await dataStorageProvider.fetchLoginState();
          expect(loginStateAfter, isTrue);
        });

        test('it invokes identify on the analytics provider', () async {
          expect(analyticsProvider.noVisitorsIdentified(), isTrue);

          await subject.call(
            identifier: identifier,
            visitorId: visitorId,
            appVersionBuild: appVersionBuild,
          );

          expect(analyticsProvider.visitorsIdentified.length, 1);
        });
      });

      group('when linking identifier fails', () {
        setUp(() {
          charlatan.whenPost(
            '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
            (_) => throw Exception(),
          );
        });

        test('throws TestTrackLoginFailureException when network request fails',
            () async {
          expect(
            () => subject.call(
              identifier: identifier,
              visitorId: visitorId,
              appVersionBuild: appVersionBuild,
            ),
            throwsA(isA<TestTrackLoginFailureException>()),
          );
        });
      });
    });
  });
}
