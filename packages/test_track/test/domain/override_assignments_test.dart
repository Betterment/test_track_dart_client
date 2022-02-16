import 'package:charlatan/charlatan.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/src/models/models.dart';
import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../networking/fakes/fake_http_client.dart';
import '../networking/fakes/fake_http_defaults.dart';

void main() {
  group('OverrideAssignments', () {
    group('call(visitorId:, assignmentOverrides:)', () {
      late HttpClient client;
      late OverrideAssignments subject;
      late Charlatan charlatan;

      final visitorId = VisitorFactory.build().id;
      final assignmentOverrides = const [
        AssignmentOverride(
          splitName: 'foo_enabled',
          variant: 'true',
        ),
      ];
      final splits = [
        SplitFactory.build(isFeatureGate: false).withVariants([
          const Variant(name: 'foo', weight: 50),
          const Variant(name: 'bar', weight: 50),
        ])
      ];
      final assignments = [
        const Assignment(
          splitName: 'foo_split',
          variant: 'foo',
          context: 'none',
        )
      ];
      late List<Map<String, dynamic>>? assignmentsFromRequest;

      setUp(() async {
        charlatan = Charlatan()
          ..whenPost(
            '/api/v2/visitors/$visitorId/assignment_overrides',
            (request) {
              final data = request.body as Map<String, Object?>?;
              assignmentsFromRequest = data?['assignments'] as List<Map<String, Object?>>?;
            },
            statusCode: 204,
          )
          ..whenGetVisitorConfig(
            response: AppVisitorConfig(
              splits: splits,
              visitor: Visitor(id: visitorId, assignments: assignments),
            ),
          );
        client = FakeHttpClient(charlatan);
        subject = OverrideAssignments(
          client: client,
          getVisitorConfig: GetVisitorConfig(
            client: client,
            analyticsProvider: FakeAnalyticsProvider(),
            dataStorageProvider: FakeDataStorageProvider(),
          ),
        );
      });

      test('it makes a POST request to the correct url with the correct body', () async {
        await subject.call(
          appVersionBuild: AppVersionBuildFactory.build(),
          visitorId: visitorId,
          assignmentOverrides: assignmentOverrides,
        );

        expect(
          assignmentsFromRequest?.single,
          {
            'split_name': 'foo_enabled',
            'variant': 'true',
            'context': AssignmentOverride.assignmentContext,
          },
        );
      });

      test('it invokes GetVisitorConfig and returns refreshed AppVisitorConfig', () async {
        final result = await subject.call(
          appVersionBuild: AppVersionBuildFactory.build(),
          visitorId: visitorId,
          assignmentOverrides: assignmentOverrides,
        );

        // These values are returned from the `GetVisitorConfig` call
        // configured on the Charlatan instance
        expect(result.visitor.id, visitorId);
        expect(result.splitRegistry.splits, splits);
        expect(result.visitor.assignments, assignments);
      });
    });
  });
}
