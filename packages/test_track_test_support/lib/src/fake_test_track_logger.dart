import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/test_track.dart';

/// {@template fake_test_track_logger}
/// A fake [TestTrackLogger] that internally tracks
/// [LogEvent]s
/// {@endtemplate}
class FakeTestTrackLogger implements TestTrackLogger {
  @override
  final bool shouldEnableNetworkLogging;

  final _debugLogs = <LogEvent>[];
  final _infoLogs = <LogEvent>[];
  final _errorLogs = <LogEvent>[];

  /// All [LogEvent]s produced by calls to [debug]
  List<LogEvent> get debugLogs => UnmodifiableListView(_debugLogs);

  /// All [LogEvent]s produced by calls to [info]
  List<LogEvent> get infoLogs => UnmodifiableListView(_infoLogs);

  /// All [LogEvent]s produced by calls to [error]
  List<LogEvent> get errorLogs => UnmodifiableListView(_errorLogs);

  ///{@macro fake_test_track_logger}
  FakeTestTrackLogger({
    required this.shouldEnableNetworkLogging,
  });

  /// A convenience constructor to produce a [FakeTestTrackLogger]
  /// with [shouldEnableNetworkLogging] set to false
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

/// {@template log_event}
/// A representation of an invocation to one of the
/// logging functions on a [TestTrackLogger], used
/// by [FakeTestTrackLogger]
/// {@endtemplate}
class LogEvent extends Equatable {
  /// The message of the log
  final String message;

  /// A nullable error associated with the log
  final Object? error;

  /// A nullable [StackTrace] associated with the log
  final StackTrace? stackTrace;

  /// {@macro log_event}
  LogEvent(this.message, this.error, this.stackTrace);

  @override
  List<Object?> get props => [message, error, stackTrace];
}
