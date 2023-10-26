// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'identifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentifierImpl _$$IdentifierImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$IdentifierImpl',
      json,
      ($checkedConvert) {
        final val = _$IdentifierImpl(
          identifierType:
              $checkedConvert('identifier_type', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'identifierType': 'identifier_type'},
    );

Map<String, dynamic> _$$IdentifierImplToJson(_$IdentifierImpl instance) =>
    <String, dynamic>{
      'identifier_type': instance.identifierType,
      'value': instance.value,
    };
