import 'package:test_track/src/domain/get_visitor_config.dart';
import 'package:test_track/test_track.dart';

/// {@template override_visitor_id}
///
/// Allows for overriding the current visitor id with the provided one. This is
/// useful for cases where your user is assigned a visitor id from another
/// platform prior to invoking login on the SDK, and you'd like any
/// configuration assigned to that user to "follow" them to the
/// platform running this client.
///
/// If this method is called when a user has already logged in to TestTrack,
/// the request to override the current visitor id will be ignored.
///
/// If the visitor id could be overwritten, the [AppVisitorConfig] associated
/// with the visitor id will be returned. Otherwise, this function will return
/// null.
///
/// {@endtemplate}
class OverrideVisitorId {
  final GetVisitorConfig _getVisitorConfig;
  final DataStorageProvider _dataStorageProvider;
  final TestTrackLogger _logger;

  /// {@macro override_visitor_id}
  OverrideVisitorId({
    required GetVisitorConfig getVisitorConfig,
    required DataStorageProvider dataStorageProvider,
    required TestTrackLogger logger,
  }) : _getVisitorConfig = getVisitorConfig,
       _dataStorageProvider = dataStorageProvider,
       _logger = logger;

  /// {@macro override_visitor_id}
  Future<AppVisitorConfig?> call({
    required String visitorId,
    required AppVersionBuild appVersionBuild,
  }) async {
    final isLoggedIn = await _dataStorageProvider.fetchLoginState();
    if (isLoggedIn) {
      _logger.info(
        'Attempt to override visitor id ignored because a user is currently logged in.',
      );
      return null;
    }
    return _getVisitorConfig(
      visitorId: visitorId,
      appVersionBuild: appVersionBuild,
    );
  }
}
