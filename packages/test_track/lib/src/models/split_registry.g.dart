// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'split_registry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplitRegistryImpl _$$SplitRegistryImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SplitRegistryImpl',
      json,
      ($checkedConvert) {
        final val = _$SplitRegistryImpl(
          splits: $checkedConvert(
              'splits',
              (v) => (v as List<dynamic>)
                  .map((e) => Split.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SplitRegistryImplToJson(_$SplitRegistryImpl instance) =>
    <String, dynamic>{
      'splits': instance.splits.map((e) => e.toJson()).toList(),
    };
