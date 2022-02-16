import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';

class AppVersionBuildFactory {
  static AppVersionBuild build() {
    return AppVersionBuild(
      appName: randomAlpha(10),
      version: randomNumeric(5),
      buildTimestamp: randomAlphaNumeric(10),
    );
  }
}
