import 'package:test_track/test_track.dart';

/// [Exception] thrown when invoking a function on [TestTrack] before
/// it has been fully initialized
class AccessBeforeInitializationException implements TestTrackException {
  final String message;

  AccessBeforeInitializationException(this.message);
}
