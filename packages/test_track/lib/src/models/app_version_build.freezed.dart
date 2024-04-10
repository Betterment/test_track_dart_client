// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
      _$AppVersionBuildCopyWithImpl<$Res, AppVersionBuild>;
  @useResult
  $Res call({String appName, String version, String buildTimestamp});
}

/// @nodoc
class _$AppVersionBuildCopyWithImpl<$Res, $Val extends AppVersionBuild>
    implements $AppVersionBuildCopyWith<$Res> {
  _$AppVersionBuildCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? version = null,
    Object? buildTimestamp = null,
  }) {
    return _then(_value.copyWith(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildTimestamp: null == buildTimestamp
          ? _value.buildTimestamp
          : buildTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionBuildImplCopyWith<$Res>
    implements $AppVersionBuildCopyWith<$Res> {
  factory _$$AppVersionBuildImplCopyWith(_$AppVersionBuildImpl value,
          $Res Function(_$AppVersionBuildImpl) then) =
      __$$AppVersionBuildImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appName, String version, String buildTimestamp});
}

/// @nodoc
class __$$AppVersionBuildImplCopyWithImpl<$Res>
    extends _$AppVersionBuildCopyWithImpl<$Res, _$AppVersionBuildImpl>
    implements _$$AppVersionBuildImplCopyWith<$Res> {
  __$$AppVersionBuildImplCopyWithImpl(
      _$AppVersionBuildImpl _value, $Res Function(_$AppVersionBuildImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? version = null,
    Object? buildTimestamp = null,
  }) {
    return _then(_$AppVersionBuildImpl(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildTimestamp: null == buildTimestamp
          ? _value.buildTimestamp
          : buildTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$AppVersionBuildImpl implements _AppVersionBuild {
  const _$AppVersionBuildImpl(
      {required this.appName,
      required this.version,
      required this.buildTimestamp});

  factory _$AppVersionBuildImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppVersionBuildImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionBuildImpl &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildTimestamp, buildTimestamp) ||
                other.buildTimestamp == buildTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, appName, version, buildTimestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionBuildImplCopyWith<_$AppVersionBuildImpl> get copyWith =>
      __$$AppVersionBuildImplCopyWithImpl<_$AppVersionBuildImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppVersionBuildImplToJson(
      this,
    );
  }
}

abstract class _AppVersionBuild implements AppVersionBuild {
  const factory _AppVersionBuild(
      {required final String appName,
      required final String version,
      required final String buildTimestamp}) = _$AppVersionBuildImpl;

  factory _AppVersionBuild.fromJson(Map<String, dynamic> json) =
      _$AppVersionBuildImpl.fromJson;

  @override
  String get appName;
  @override
  String get version;
  @override
  String get buildTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$AppVersionBuildImplCopyWith<_$AppVersionBuildImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
