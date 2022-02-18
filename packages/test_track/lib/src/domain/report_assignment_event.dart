import 'package:test_track/src/logging/logging.dart';
import 'package:test_track/src/models/assignment_event.dart';
import 'package:test_track/src/networking/http_client.dart';

class ReportAssignmentEvent {
  final HttpClient _client;
  final TestTrackLogger _logger;

  ReportAssignmentEvent({
    required HttpClient client,
    required TestTrackLogger logger,
  })  : _client = client,
        _logger = logger;

  Future<void> call(AssignmentEvent assignmentEvent) async {
    try {
      await _client.post(
        '/api/v1/assignment_event',
        data: {
          'visitor_id': assignmentEvent.visitorId,
          'split_name': assignmentEvent.splitName,
          'context': assignmentEvent.context,
        },
        isIdempotent: true,
      );
    } on Exception catch (error) {
      _logger.error(
          'Unable to report assignment event: $assignmentEvent with error: $error');
    }
  }
}
