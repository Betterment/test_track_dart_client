import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';

/// {@template app_version_build_factory}
/// Produces [AppVersionBuild]s to be used for
/// testing
/// {@endtemplate}
class AppVersionBuildFactory {
  /// {@macro app_version_build_factory}
  static AppVersionBuild build() {
    return AppVersionBuild(
      appName: randomAlpha(10),
      version: randomNumeric(5),
      buildTimestamp: randomAlphaNumeric(10),
    );
  }
}
