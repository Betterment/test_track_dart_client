// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Split _$$_SplitFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Split',
      json,
      ($checkedConvert) {
        final val = _$_Split(
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

Map<String, dynamic> _$$_SplitToJson(_$_Split instance) => <String, dynamic>{
      'name': instance.name,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
      'feature_gate': instance.isFeatureGate,
    };
