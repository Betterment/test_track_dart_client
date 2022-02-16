import 'package:test_track/src/models/assignment.dart';

/// Interface for connecting TestTrack to an analytics system, e.g. Segment
abstract class AnalyticsProvider {
  /// Track this assignment for the provided visitor identifier in the analytics service
  Future<void> trackAssignment({
    required String visitorId,
    required Assignment assignment,
  });

  /// Associate this visitor id with the current entity in the analytics services
  Future<void> identify({required String visitorId});
}
