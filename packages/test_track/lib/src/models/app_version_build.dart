import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_build.freezed.dart';
part 'app_version_build.g.dart';

@freezed
class AppVersionBuild with _$AppVersionBuild {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory AppVersionBuild({
    required String appName,
    required String version,
    required String buildTimestamp,
  }) = _AppVersionBuild;

  factory AppVersionBuild.fromJson(Map<String, dynamic> json) =>
      _$AppVersionBuildFromJson(json);
}
