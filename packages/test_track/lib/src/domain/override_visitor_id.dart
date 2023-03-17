import 'package:test_track/src/domain/get_visitor_config.dart';
import 'package:test_track/src/errors/test_track_exception.dart';
import 'package:test_track/src/models/app_version_build.dart';
import 'package:test_track/src/models/app_visitor_config.dart';
import 'package:test_track/src/persistence/data_storage_provider.dart';

/// {@template override_visitor_id}
///
/// Allows for overriding the current visitor id with the provided one. This is
/// useful for cases where your user is assigned a visitor id from another
/// platform prior to invoking login on the SDK, and you'd like any
/// configuration assigned to that user to "follow" them to the
/// platform running this client.
///
/// If this method is called when a user has already logged in to TestTrack,
/// a [TestTrackInvalidVisitorOverrideException] will be thrown. This is to
/// prevent clobbering the visitor configuration of the existing user.
///
/// {@endtemplate}
class OverrideVisitorId {
  final GetVisitorConfig _getVisitorConfig;
  final DataStorageProvider _dataStorageProvider;

  /// {@macro override_visitor_id}
  OverrideVisitorId({
    required GetVisitorConfig getVisitorConfig,
    required DataStorageProvider dataStorageProvider,
  })  : _getVisitorConfig = getVisitorConfig,
        _dataStorageProvider = dataStorageProvider;

  /// {@macro override_visitor_id}
  Future<AppVisitorConfig> call({
    required String visitorId,
    required AppVersionBuild appVersionBuild,
  }) async {
    final isLoggedIn = await _dataStorageProvider.fetchLoginState();
    if (isLoggedIn) {
      throw TestTrackInvalidVisitorOverrideException();
    }
    return _getVisitorConfig(
      visitorId: visitorId,
      appVersionBuild: appVersionBuild,
    );
  }
}

/// {@template split_not_found_exception}
/// [TestTrackException] thrown when an attempt is made to override the visitor
/// id of the existing logged in user.
/// {@endtemplate}
class TestTrackInvalidVisitorOverrideException implements TestTrackException {}
