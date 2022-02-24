// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'app_version_build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppVersionBuild _$$_AppVersionBuildFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_AppVersionBuild',
      json,
      ($checkedConvert) {
        final val = _$_AppVersionBuild(
          appName: $checkedConvert('appName', (v) => v as String),
          version: $checkedConvert('version', (v) => v as String),
          buildTimestamp: $checkedConvert('buildTimestamp', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_AppVersionBuildToJson(_$_AppVersionBuild instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'version': instance.version,
      'buildTimestamp': instance.buildTimestamp,
    };
