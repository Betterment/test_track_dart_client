import 'package:dart_mappable/dart_mappable.dart';

part 'app_version_build.mapper.dart';

/// {@template app_version_build}
/// Encapsulates the metadata associated with
/// a specific version of your application
/// {@endtemplate}
@MappableClass()
class AppVersionBuild with AppVersionBuildMappable {
  /// {@macro app_version_build}
  ///
  /// The [appName], [version], and [buildTimestamp] are
  /// utilized to uniquely identify a particular build
  /// so that TestTrack can configure the app correctly
  const AppVersionBuild({
    required this.appName,
    required this.version,
    required this.buildTimestamp,
  });

  final String appName;
  final String version;
  final String buildTimestamp;
}
