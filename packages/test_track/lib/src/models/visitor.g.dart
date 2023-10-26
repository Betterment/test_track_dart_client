// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorImpl _$$VisitorImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$VisitorImpl',
      json,
      ($checkedConvert) {
        final val = _$VisitorImpl(
          assignments: $checkedConvert(
              'assignments',
              (v) => (v as List<dynamic>)
                  .map((e) => Assignment.fromJson(e as Map<String, dynamic>))
                  .toList()),
          id: $checkedConvert('id', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$VisitorImplToJson(_$VisitorImpl instance) =>
    <String, dynamic>{
      'assignments': instance.assignments.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
