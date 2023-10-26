// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'app_visitor_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppVisitorConfigImpl _$$AppVisitorConfigImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AppVisitorConfigImpl',
      json,
      ($checkedConvert) {
        final val = _$AppVisitorConfigImpl(
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

Map<String, dynamic> _$$AppVisitorConfigImplToJson(
        _$AppVisitorConfigImpl instance) =>
    <String, dynamic>{
      'splits': instance.splits.map((e) => e.toJson()).toList(),
      'visitor': instance.visitor.toJson(),
    };
