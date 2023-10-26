// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'split.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplitImpl _$$SplitImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$SplitImpl',
      json,
      ($checkedConvert) {
        final val = _$SplitImpl(
          name: $checkedConvert('name', (v) => v as String),
          variants: $checkedConvert(
              'variants',
              (v) => (v as List<dynamic>)
                  .map((e) => Variant.fromJson(e as Map<String, dynamic>))
                  .toList()),
          isFeatureGate: $checkedConvert('feature_gate', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isFeatureGate': 'feature_gate'},
    );

Map<String, dynamic> _$$SplitImplToJson(_$SplitImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
      'feature_gate': instance.isFeatureGate,
    };
