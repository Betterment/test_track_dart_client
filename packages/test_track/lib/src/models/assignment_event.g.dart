// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'assignment_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssignmentEvent _$$_AssignmentEventFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_AssignmentEvent',
      json,
      ($checkedConvert) {
        final val = _$_AssignmentEvent(
          visitorId: $checkedConvert('visitor_id', (v) => v as String),
          splitName: $checkedConvert('split_name', (v) => v as String),
          context: $checkedConvert('context', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'visitorId': 'visitor_id', 'splitName': 'split_name'},
    );

Map<String, dynamic> _$$_AssignmentEventToJson(_$_AssignmentEvent instance) =>
    <String, dynamic>{
      'visitor_id': instance.visitorId,
      'split_name': instance.splitName,
      'context': instance.context,
    };
