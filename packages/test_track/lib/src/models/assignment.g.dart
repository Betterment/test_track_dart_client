// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentImpl _$$AssignmentImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AssignmentImpl',
      json,
      ($checkedConvert) {
        final val = _$AssignmentImpl(
          splitName: $checkedConvert('split_name', (v) => v as String),
          variant: $checkedConvert('variant', (v) => v as String),
          context: $checkedConvert('context', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {'splitName': 'split_name'},
    );

Map<String, dynamic> _$$AssignmentImplToJson(_$AssignmentImpl instance) =>
    <String, dynamic>{
      'split_name': instance.splitName,
      'variant': instance.variant,
      'context': instance.context,
    };
