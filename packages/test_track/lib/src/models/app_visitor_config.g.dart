// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_visitor_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppVisitorConfig _$$_AppVisitorConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_AppVisitorConfig',
      json,
      ($checkedConvert) {
        final val = _$_AppVisitorConfig(
          splits: $checkedConvert(
              'splits',
              (v) => (v as List<dynamic>)
                  .map((e) => Split.fromJson(e as Map<String, dynamic>))
                  .toList()),
          visitor: $checkedConvert(
              'visitor', (v) => Visitor.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_AppVisitorConfigToJson(_$_AppVisitorConfig instance) =>
    <String, dynamic>{
      'splits': instance.splits.map((e) => e.toJson()).toList(),
      'visitor': instance.visitor.toJson(),
    };
