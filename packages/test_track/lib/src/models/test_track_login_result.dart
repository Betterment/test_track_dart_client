import 'package:test_track/src/errors/errors.dart';

/// The outcome of `TestTrack.login`.
sealed class TestTrackLoginResult {
  const TestTrackLoginResult();
}

/// The identifier was linked and the visitor config was updated.
final class TestTrackLoginSuccess extends TestTrackLoginResult {
  /// Creates a [TestTrackLoginSuccess].
  const TestTrackLoginSuccess();
}

/// The login failed and the existing visitor config is unchanged.
final class TestTrackLoginFailure extends TestTrackLoginResult {
  /// The reason the login failed.
  final TestTrackException error;

  /// Creates a [TestTrackLoginFailure].
  const TestTrackLoginFailure(this.error);

  /// Whether the login failed because the call timed out.
  bool get isTimeout => error is TestTrackTimeoutException;
}
