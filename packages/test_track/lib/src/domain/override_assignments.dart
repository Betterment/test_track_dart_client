import 'package:test_track/src/domain/get_visitor_config.dart';
import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track/test_track.dart';

/// {@template override_assignments}
/// Overrides the [Assignment]s of the [Visitor]
/// with the provided visitor id
/// {@endtemplate}
class OverrideAssignments {
  final HttpClient _client;
  final GetVisitorConfig _getVisitorConfig;

  OverrideAssignments({
    required HttpClient client,
    required GetVisitorConfig getVisitorConfig,
  })  : _client = client,
        _getVisitorConfig = getVisitorConfig;

  Future<AppVisitorConfig> call({
    required AppVersionBuild appVersionBuild,
    required String visitorId,
    required List<AssignmentOverride> assignmentOverrides,
  }) async {
    await _client.post(
      '/api/v2/visitors/$visitorId/assignment_overrides',
      data: {
        'assignments': assignmentOverrides.map((a) => a.toJson()).toList(),
      },
    );

    final refreshedAppVisitorConfig = await _getVisitorConfig(
      appVersionBuild: appVersionBuild,
      visitorId: visitorId,
    );

    return refreshedAppVisitorConfig;
  }
}
