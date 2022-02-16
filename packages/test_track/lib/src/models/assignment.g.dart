// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Assignment _$$_AssignmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_Assignment',
      json,
      ($checkedConvert) {
        final val = _$_Assignment(
          splitName: $checkedConvert('split_name', (v) => v as String),
          variant: $checkedConvert('variant', (v) => v as String),
          context: $checkedConvert('context', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {'splitName': 'split_name'},
    );

Map<String, dynamic> _$$_AssignmentToJson(_$_Assignment instance) =>
    <String, dynamic>{
      'split_name': instance.splitName,
      'variant': instance.variant,
      'context': instance.context,
    };
