// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'identifier.dart';

class IdentifierMapper extends ClassMapperBase<Identifier> {
  IdentifierMapper._();

  static IdentifierMapper? _instance;
  static IdentifierMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IdentifierMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Identifier';

  static String _$identifierType(Identifier v) => v.identifierType;
  static const Field<Identifier, String> _f$identifierType = Field(
    'identifierType',
    _$identifierType,
    key: r'identifier_type',
  );
  static String _$value(Identifier v) => v.value;
  static const Field<Identifier, String> _f$value = Field('value', _$value);

  @override
  final MappableFields<Identifier> fields = const {
    #identifierType: _f$identifierType,
    #value: _f$value,
  };

  static Identifier _instantiate(DecodingData data) {
    return Identifier(
      identifierType: data.dec(_f$identifierType),
      value: data.dec(_f$value),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Identifier fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Identifier>(map);
  }

  static Identifier fromJson(String json) {
    return ensureInitialized().decodeJson<Identifier>(json);
  }
}

mixin IdentifierMappable {
  String toJson() {
    return IdentifierMapper.ensureInitialized().encodeJson<Identifier>(
      this as Identifier,
    );
  }

  Map<String, dynamic> toMap() {
    return IdentifierMapper.ensureInitialized().encodeMap<Identifier>(
      this as Identifier,
    );
  }

  IdentifierCopyWith<Identifier, Identifier, Identifier> get copyWith =>
      _IdentifierCopyWithImpl<Identifier, Identifier>(
        this as Identifier,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return IdentifierMapper.ensureInitialized().stringifyValue(
      this as Identifier,
    );
  }

  @override
  bool operator ==(Object other) {
    return IdentifierMapper.ensureInitialized().equalsValue(
      this as Identifier,
      other,
    );
  }

  @override
  int get hashCode {
    return IdentifierMapper.ensureInitialized().hashValue(this as Identifier);
  }
}

extension IdentifierValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Identifier, $Out> {
  IdentifierCopyWith<$R, Identifier, $Out> get $asIdentifier =>
      $base.as((v, t, t2) => _IdentifierCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IdentifierCopyWith<$R, $In extends Identifier, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? identifierType, String? value});
  IdentifierCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IdentifierCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Identifier, $Out>
    implements IdentifierCopyWith<$R, Identifier, $Out> {
  _IdentifierCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Identifier> $mapper =
      IdentifierMapper.ensureInitialized();
  @override
  $R call({String? identifierType, String? value}) => $apply(
    FieldCopyWithData({
      if (identifierType != null) #identifierType: identifierType,
      if (value != null) #value: value,
    }),
  );
  @override
  Identifier $make(CopyWithData data) => Identifier(
    identifierType: data.get(#identifierType, or: $value.identifierType),
    value: data.get(#value, or: $value.value),
  );

  @override
  IdentifierCopyWith<$R2, Identifier, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _IdentifierCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

