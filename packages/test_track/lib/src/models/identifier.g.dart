// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Identifier _$$_IdentifierFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_Identifier',
      json,
      ($checkedConvert) {
        final val = _$_Identifier(
          identifierType:
              $checkedConvert('identifier_type', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'identifierType': 'identifier_type'},
    );

Map<String, dynamic> _$$_IdentifierToJson(_$_Identifier instance) =>
    <String, dynamic>{
      'identifier_type': instance.identifierType,
      'value': instance.value,
    };
