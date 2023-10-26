// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'assignment_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentEventImpl _$$AssignmentEventImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AssignmentEventImpl',
      json,
      ($checkedConvert) {
        final val = _$AssignmentEventImpl(
          visitorId: $checkedConvert('visitor_id', (v) => v as String),
          splitName: $checkedConvert('split_name', (v) => v as String),
          context: $checkedConvert('context', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'visitorId': 'visitor_id', 'splitName': 'split_name'},
    );

Map<String, dynamic> _$$AssignmentEventImplToJson(
        _$AssignmentEventImpl instance) =>
    <String, dynamic>{
      'visitor_id': instance.visitorId,
      'split_name': instance.splitName,
      'context': instance.context,
    };
