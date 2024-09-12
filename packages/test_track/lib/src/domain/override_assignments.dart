import 'package:sturdy_http/sturdy_http.dart';
import 'package:test_track/src/domain/get_visitor_config.dart';
import 'package:test_track/test_track.dart';

/// {@template override_assignments}
/// Overrides the [Assignment]s of the [Visitor]
/// with the provided visitor id
/// {@endtemplate}
class OverrideAssignments {
  final SturdyHttp _client;
  final GetVisitorConfig _getVisitorConfig;

  /// {@macro override_assignments}
  OverrideAssignments({
    required SturdyHttp client,
    required GetVisitorConfig getVisitorConfig,
  })  : _client = client,
        _getVisitorConfig = getVisitorConfig;

  /// {@macro override_assignments}
  Future<AppVisitorConfig> call({
    required AppVersionBuild appVersionBuild,
    required String visitorId,
    required List<AssignmentOverride> assignmentOverrides,
  }) async {
    await _client.execute(
      PostRequest(
        '/api/v2/visitors/$visitorId/assignment_overrides',
        data: NetworkRequestBody.json({
          'assignments': assignmentOverrides.map((a) => a.toJson()).toList(),
        }),
      ),
      onResponse: (r) => switch (r) {
        NoContent() => null,
        _ => throw Exception('Failed to override assignments: $r'),
      },
    );

    final refreshedAppVisitorConfig = await _getVisitorConfig(
      appVersionBuild: appVersionBuild,
      visitorId: visitorId,
    );

    return refreshedAppVisitorConfig;
  }
}
