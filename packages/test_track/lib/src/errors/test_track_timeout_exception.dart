import 'package:test_track/src/errors/test_track_exception.dart';

/// [TestTrackException] thrown when a request does not complete within
/// its call timeout.
class TestTrackTimeoutException implements TestTrackException {
  /// The call timeout that elapsed.
  final Duration timeout;

  /// Creates a [TestTrackTimeoutException] for the elapsed [timeout].
  const TestTrackTimeoutException(this.timeout);

  /// A description of the timeout.
  String get message => 'No response within ${timeout.inMilliseconds} ms';
}
