import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_build.freezed.dart';
part 'app_version_build.g.dart';

/// {@template app_version_build}
/// Encapsulates the metadata associated with
/// a specific version of your application
/// {@endtemplate}
@freezed
class AppVersionBuild with _$AppVersionBuild {
  /// {@macro app_version_build}
  ///
  /// The [appName], [version], and [buildTimestamp] are
  /// utilized to uniquely identify a particular build
  /// so that TestTrack can configure the app correctly
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory AppVersionBuild({
    required String appName,
    required String version,
    required String buildTimestamp,
  }) = _AppVersionBuild;

  // ignore: public_member_api_docs
  factory AppVersionBuild.fromJson(Map<String, dynamic> json) =>
      _$AppVersionBuildFromJson(json);
}
