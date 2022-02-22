/// A logger interface used by TestTrack to communicate
/// activity back to consumers
abstract class TestTrackLogger {
  /// Whether network activity should be emitted to this logger
  bool get shouldEnableNetworkLogging;

  /// Invoked with debug-priority log activity, generally things
  /// like network activity if [shouldEnableNetworkLogging] is true
  void debug(String message, {Object? error, StackTrace? stackTrace});

  /// Invoked with info-priority log activity, generally interesting
  /// events that TestTrack can recover from on its own
  void info(String message, {Object? error, StackTrace? stackTrace});

  /// Invoked with error-priority log activity, generally things
  /// that you definitely want to be aware of as they may indicate
  /// a problem with your integration
  void error(String message, {Object? error, StackTrace? stackTrace});
}
