// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_registry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SplitRegistry _$$_SplitRegistryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SplitRegistry',
      json,
      ($checkedConvert) {
        final val = _$_SplitRegistry(
          splits: $checkedConvert(
              'splits',
              (v) => (v as List<dynamic>)
                  .map((e) => Split.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SplitRegistryToJson(_$_SplitRegistry instance) =>
    <String, dynamic>{
      'splits': instance.splits.map((e) => e.toJson()).toList(),
    };
