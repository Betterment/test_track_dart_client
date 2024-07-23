// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariantImpl _$$VariantImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$VariantImpl',
      json,
      ($checkedConvert) {
        final val = _$VariantImpl(
          name: $checkedConvert('name', (v) => v as String),
          weight: $checkedConvert('weight', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$VariantImplToJson(_$VariantImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
    };
