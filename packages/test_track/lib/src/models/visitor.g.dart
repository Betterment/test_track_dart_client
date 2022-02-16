// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Visitor _$$_VisitorFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Visitor',
      json,
      ($checkedConvert) {
        final val = _$_Visitor(
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

Map<String, dynamic> _$$_VisitorToJson(_$_Visitor instance) =>
    <String, dynamic>{
      'assignments': instance.assignments.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
