// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'app_version_build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppVersionBuildImpl _$$AppVersionBuildImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AppVersionBuildImpl',
      json,
      ($checkedConvert) {
        final val = _$AppVersionBuildImpl(
          appName: $checkedConvert('appName', (v) => v as String),
          version: $checkedConvert('version', (v) => v as String),
          buildTimestamp: $checkedConvert('buildTimestamp', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$AppVersionBuildImplToJson(
        _$AppVersionBuildImpl instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'version': instance.version,
      'buildTimestamp': instance.buildTimestamp,
    };
