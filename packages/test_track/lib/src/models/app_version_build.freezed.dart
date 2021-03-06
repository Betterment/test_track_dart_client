// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_version_build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppVersionBuild _$AppVersionBuildFromJson(Map<String, dynamic> json) {
  return _AppVersionBuild.fromJson(json);
}

/// @nodoc
mixin _$AppVersionBuild {
  String get appName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get buildTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionBuildCopyWith<AppVersionBuild> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionBuildCopyWith<$Res> {
  factory $AppVersionBuildCopyWith(
          AppVersionBuild value, $Res Function(AppVersionBuild) then) =
      _$AppVersionBuildCopyWithImpl<$Res>;
  $Res call({String appName, String version, String buildTimestamp});
}

/// @nodoc
class _$AppVersionBuildCopyWithImpl<$Res>
    implements $AppVersionBuildCopyWith<$Res> {
  _$AppVersionBuildCopyWithImpl(this._value, this._then);

  final AppVersionBuild _value;
  // ignore: unused_field
  final $Res Function(AppVersionBuild) _then;

  @override
  $Res call({
    Object? appName = freezed,
    Object? version = freezed,
    Object? buildTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildTimestamp: buildTimestamp == freezed
          ? _value.buildTimestamp
          : buildTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AppVersionBuildCopyWith<$Res>
    implements $AppVersionBuildCopyWith<$Res> {
  factory _$$_AppVersionBuildCopyWith(
          _$_AppVersionBuild value, $Res Function(_$_AppVersionBuild) then) =
      __$$_AppVersionBuildCopyWithImpl<$Res>;
  @override
  $Res call({String appName, String version, String buildTimestamp});
}

/// @nodoc
class __$$_AppVersionBuildCopyWithImpl<$Res>
    extends _$AppVersionBuildCopyWithImpl<$Res>
    implements _$$_AppVersionBuildCopyWith<$Res> {
  __$$_AppVersionBuildCopyWithImpl(
      _$_AppVersionBuild _value, $Res Function(_$_AppVersionBuild) _then)
      : super(_value, (v) => _then(v as _$_AppVersionBuild));

  @override
  _$_AppVersionBuild get _value => super._value as _$_AppVersionBuild;

  @override
  $Res call({
    Object? appName = freezed,
    Object? version = freezed,
    Object? buildTimestamp = freezed,
  }) {
    return _then(_$_AppVersionBuild(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildTimestamp: buildTimestamp == freezed
          ? _value.buildTimestamp
          : buildTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$_AppVersionBuild implements _AppVersionBuild {
  const _$_AppVersionBuild(
      {required this.appName,
      required this.version,
      required this.buildTimestamp});

  factory _$_AppVersionBuild.fromJson(Map<String, dynamic> json) =>
      _$$_AppVersionBuildFromJson(json);

  @override
  final String appName;
  @override
  final String version;
  @override
  final String buildTimestamp;

  @override
  String toString() {
    return 'AppVersionBuild(appName: $appName, version: $version, buildTimestamp: $buildTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppVersionBuild &&
            const DeepCollectionEquality().equals(other.appName, appName) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.buildTimestamp, buildTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appName),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(buildTimestamp));

  @JsonKey(ignore: true)
  @override
  _$$_AppVersionBuildCopyWith<_$_AppVersionBuild> get copyWith =>
      __$$_AppVersionBuildCopyWithImpl<_$_AppVersionBuild>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppVersionBuildToJson(
      this,
    );
  }
}

abstract class _AppVersionBuild implements AppVersionBuild {
  const factory _AppVersionBuild(
      {required final String appName,
      required final String version,
      required final String buildTimestamp}) = _$_AppVersionBuild;

  factory _AppVersionBuild.fromJson(Map<String, dynamic> json) =
      _$_AppVersionBuild.fromJson;

  @override
  String get appName;
  @override
  String get version;
  @override
  String get buildTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$_AppVersionBuildCopyWith<_$_AppVersionBuild> get copyWith =>
      throw _privateConstructorUsedError;
}
