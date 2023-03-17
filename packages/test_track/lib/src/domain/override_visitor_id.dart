import 'package:test_track/src/domain/get_visitor_config.dart';
import 'package:test_track/src/models/app_version_build.dart';
import 'package:test_track/src/models/app_visitor_config.dart';

class OverrideVisitorId {
  final GetVisitorConfig _getVisitorConfig;

  OverrideVisitorId({
    required GetVisitorConfig getVisitorConfig,
  }) : _getVisitorConfig = getVisitorConfig;

  Future<AppVisitorConfig> call({
    required String visitorId,
    required AppVersionBuild appVersionBuild,
  }) {
    return _getVisitorConfig(
      visitorId: visitorId,
      appVersionBuild: appVersionBuild,
    );
  }
}
