// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'variant.dart';

class VariantMapper extends ClassMapperBase<Variant> {
  VariantMapper._();

  static VariantMapper? _instance;
  static VariantMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VariantMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Variant';

  static String _$name(Variant v) => v.name;
  static const Field<Variant, String> _f$name = Field('name', _$name);
  static int _$weight(Variant v) => v.weight;
  static const Field<Variant, int> _f$weight = Field('weight', _$weight);

  @override
  final MappableFields<Variant> fields = const {
    #name: _f$name,
    #weight: _f$weight,
  };

  static Variant _instantiate(DecodingData data) {
    return Variant(name: data.dec(_f$name), weight: data.dec(_f$weight));
  }

  @override
  final Function instantiate = _instantiate;

  static Variant fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Variant>(map);
  }

  static Variant fromJson(String json) {
    return ensureInitialized().decodeJson<Variant>(json);
  }
}

mixin VariantMappable {
  String toJson() {
    return VariantMapper.ensureInitialized().encodeJson<Variant>(
      this as Variant,
    );
  }

  Map<String, dynamic> toMap() {
    return VariantMapper.ensureInitialized().encodeMap<Variant>(
      this as Variant,
    );
  }

  VariantCopyWith<Variant, Variant, Variant> get copyWith =>
      _VariantCopyWithImpl<Variant, Variant>(
        this as Variant,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return VariantMapper.ensureInitialized().stringifyValue(this as Variant);
  }

  @override
  bool operator ==(Object other) {
    return VariantMapper.ensureInitialized().equalsValue(
      this as Variant,
      other,
    );
  }

  @override
  int get hashCode {
    return VariantMapper.ensureInitialized().hashValue(this as Variant);
  }
}

extension VariantValueCopy<$R, $Out> on ObjectCopyWith<$R, Variant, $Out> {
  VariantCopyWith<$R, Variant, $Out> get $asVariant =>
      $base.as((v, t, t2) => _VariantCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VariantCopyWith<$R, $In extends Variant, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, int? weight});
  VariantCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VariantCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Variant, $Out>
    implements VariantCopyWith<$R, Variant, $Out> {
  _VariantCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Variant> $mapper =
      VariantMapper.ensureInitialized();
  @override
  $R call({String? name, int? weight}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (weight != null) #weight: weight,
    }),
  );
  @override
  Variant $make(CopyWithData data) => Variant(
    name: data.get(#name, or: $value.name),
    weight: data.get(#weight, or: $value.weight),
  );

  @override
  VariantCopyWith<$R2, Variant, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VariantCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

