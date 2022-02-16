import 'package:test_track/test_track.dart';

/// The default implementation of [TestTrackLogger] that does not log anything,
/// including network activity.
///
/// This is used if the consumer of [TestTrack] does not supply their
/// own [TestTrackLogger].
class SilentTestTrackLogger implements TestTrackLogger {
  const SilentTestTrackLogger();
  @override
  void debug(String message, {Object? error, StackTrace? stackTrace}) {}

  @override
  void info(String message, {Object? error, StackTrace? stackTrace}) {}

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {}

  @override
  bool get shouldEnableNetworkLogging => false;
}
