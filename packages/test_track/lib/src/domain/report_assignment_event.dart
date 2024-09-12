import 'package:sturdy_http/sturdy_http.dart';
import 'package:test_track/src/logging/logging.dart';
import 'package:test_track/src/models/models.dart';
import 'package:test_track/src/networking/extras.dart';

/// {@template report_assignment_event}
/// Reports an [AssignmentEvent] to the TestTrack server
///
/// Because [Assignment]s are deterministic and therefore
/// not critical to be reported, [Exception]s thrown
/// while attempting to report the [AssignmentEvent]
/// are caught and logged to the [TestTrackLogger]
/// {@endtemplate}
class ReportAssignmentEvent {
  final SturdyHttp _client;
  final TestTrackLogger _logger;

  /// {@macro report_assignment_event}
  ReportAssignmentEvent({
    required SturdyHttp client,
    required TestTrackLogger logger,
  })  : _client = client,
        _logger = logger;

  /// {@macro report_assignment_event}
  Future<void> call(AssignmentEvent assignmentEvent) async {
    await _client.execute(
      IdempotentPostRequest(
        '/api/v1/assignment_event',
        data: NetworkRequestBody.json(
          {
            'visitor_id': assignmentEvent.visitorId,
            'split_name': assignmentEvent.splitName,
            'context': assignmentEvent.context,
          },
        ),
      ),
      onResponse: (r) => switch (r) {
        NoContent() => null,
        _ => _logger.error('Unable to report assignment event: $assignmentEvent with error: $r'),
      },
    );
  }
}
