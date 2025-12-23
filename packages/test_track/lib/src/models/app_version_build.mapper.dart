// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_version_build.dart';

class AppVersionBuildMapper extends ClassMapperBase<AppVersionBuild> {
  AppVersionBuildMapper._();

  static AppVersionBuildMapper? _instance;
  static AppVersionBuildMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppVersionBuildMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AppVersionBuild';

  static String _$appName(AppVersionBuild v) => v.appName;
  static const Field<AppVersionBuild, String> _f$appName = Field(
    'appName',
    _$appName,
    key: r'app_name',
  );
  static String _$version(AppVersionBuild v) => v.version;
  static const Field<AppVersionBuild, String> _f$version = Field(
    'version',
    _$version,
  );
  static String _$buildTimestamp(AppVersionBuild v) => v.buildTimestamp;
  static const Field<AppVersionBuild, String> _f$buildTimestamp = Field(
    'buildTimestamp',
    _$buildTimestamp,
    key: r'build_timestamp',
  );

  @override
  final MappableFields<AppVersionBuild> fields = const {
    #appName: _f$appName,
    #version: _f$version,
    #buildTimestamp: _f$buildTimestamp,
  };

  static AppVersionBuild _instantiate(DecodingData data) {
    return AppVersionBuild(
      appName: data.dec(_f$appName),
      version: data.dec(_f$version),
      buildTimestamp: data.dec(_f$buildTimestamp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppVersionBuild fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppVersionBuild>(map);
  }

  static AppVersionBuild fromJson(String json) {
    return ensureInitialized().decodeJson<AppVersionBuild>(json);
  }
}

mixin AppVersionBuildMappable {
  String toJson() {
    return AppVersionBuildMapper.ensureInitialized()
        .encodeJson<AppVersionBuild>(this as AppVersionBuild);
  }

  Map<String, dynamic> toMap() {
    return AppVersionBuildMapper.ensureInitialized().encodeMap<AppVersionBuild>(
      this as AppVersionBuild,
    );
  }

  AppVersionBuildCopyWith<AppVersionBuild, AppVersionBuild, AppVersionBuild>
  get copyWith =>
      _AppVersionBuildCopyWithImpl<AppVersionBuild, AppVersionBuild>(
        this as AppVersionBuild,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppVersionBuildMapper.ensureInitialized().stringifyValue(
      this as AppVersionBuild,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppVersionBuildMapper.ensureInitialized().equalsValue(
      this as AppVersionBuild,
      other,
    );
  }

  @override
  int get hashCode {
    return AppVersionBuildMapper.ensureInitialized().hashValue(
      this as AppVersionBuild,
    );
  }
}

extension AppVersionBuildValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppVersionBuild, $Out> {
  AppVersionBuildCopyWith<$R, AppVersionBuild, $Out> get $asAppVersionBuild =>
      $base.as((v, t, t2) => _AppVersionBuildCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppVersionBuildCopyWith<$R, $In extends AppVersionBuild, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? appName, String? version, String? buildTimestamp});
  AppVersionBuildCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppVersionBuildCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppVersionBuild, $Out>
    implements AppVersionBuildCopyWith<$R, AppVersionBuild, $Out> {
  _AppVersionBuildCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppVersionBuild> $mapper =
      AppVersionBuildMapper.ensureInitialized();
  @override
  $R call({String? appName, String? version, String? buildTimestamp}) => $apply(
    FieldCopyWithData({
      if (appName != null) #appName: appName,
      if (version != null) #version: version,
      if (buildTimestamp != null) #buildTimestamp: buildTimestamp,
    }),
  );
  @override
  AppVersionBuild $make(CopyWithData data) => AppVersionBuild(
    appName: data.get(#appName, or: $value.appName),
    version: data.get(#version, or: $value.version),
    buildTimestamp: data.get(#buildTimestamp, or: $value.buildTimestamp),
  );

  @override
  AppVersionBuildCopyWith<$R2, AppVersionBuild, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppVersionBuildCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

