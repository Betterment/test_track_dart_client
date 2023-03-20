import 'package:test_track/test_track.dart';

/// {@template test_track_logout}
///
/// Indicates that the user has been logged out to the [DataStorageProvider].
///
/// Does *not* alter the stored [Visitor] in any way. This is in contrast to
/// `reset` which clears all [Visitor] state.
///
/// {@endtemplate}
class Logout {
  final DataStorageProvider _dataStorageProvider;

  /// {@macro test_track_logout}
  Logout({
    required DataStorageProvider dataStorageProvider,
  }) : _dataStorageProvider = dataStorageProvider;

  /// {@macro test_track_logout}
  Future<void> call() async {
    await _dataStorageProvider.storeLoginState(false);
  }
}
