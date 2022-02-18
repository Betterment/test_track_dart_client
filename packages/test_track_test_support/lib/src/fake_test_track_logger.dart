import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/test_track.dart';

/// A fake [TestTrackLogger] that internally tracks
/// [LogEvent]s to [debug] and [error]
class FakeTestTrackLogger implements TestTrackLogger {
  @override
  final bool shouldEnableNetworkLogging;

  /// Contains all [LogEvent]s that were produced from calls to [debug]
  final _debugLogs = <LogEvent>[];

  /// Contains all [LogEvent]s that were produced from calls to [info]
  final _infoLogs = <LogEvent>[];

  /// Contains all [LogEvent]s that were produced from calls to [error]
  final _errorLogs = <LogEvent>[];

  List<LogEvent> get debugLogs => UnmodifiableListView(_debugLogs);
  List<LogEvent> get infoLogs => UnmodifiableListView(_infoLogs);
  List<LogEvent> get errorLogs => UnmodifiableListView(_errorLogs);

  FakeTestTrackLogger({
    required this.shouldEnableNetworkLogging,
  });

  factory FakeTestTrackLogger.withoutNetworkLogging() =>
      FakeTestTrackLogger(shouldEnableNetworkLogging: false);

  @override
  void debug(String message, {Object? error, StackTrace? stackTrace}) {
    _debugLogs.add(LogEvent(message, error, stackTrace));
  }

  @override
  void info(String message, {Object? error, StackTrace? stackTrace}) {
    _infoLogs.add(LogEvent(message, error, stackTrace));
  }

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _errorLogs.add(LogEvent(message, error, stackTrace));
  }

  /// True if [debug] has not been called for the life of this
  /// [FakeTestTrackLogger]
  bool get noDebugLogs => debugLogs.isEmpty;

  /// True if [info] has not been called for the life of this
  /// [FakeTestTrackLogger]
  bool get noInfoLogs => infoLogs.isEmpty;

  /// True if [error] has not been called for the life of this
  /// [FakeTestTrackLogger]
  bool get noErrorLogs => errorLogs.isEmpty;
}

class LogEvent {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  LogEvent(this.message, this.error, this.stackTrace);
}
