// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Variant _$$_VariantFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Variant',
      json,
      ($checkedConvert) {
        final val = _$_Variant(
          name: $checkedConvert('name', (v) => v as String),
          weight: $checkedConvert('weight', (v) => v as int),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_VariantToJson(_$_Variant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
    };
