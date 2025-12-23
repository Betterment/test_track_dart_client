// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'split.dart';

class SplitMapper extends ClassMapperBase<Split> {
  SplitMapper._();

  static SplitMapper? _instance;
  static SplitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SplitMapper._());
      VariantMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Split';

  static String _$name(Split v) => v.name;
  static const Field<Split, String> _f$name = Field('name', _$name);
  static List<Variant> _$variants(Split v) => v.variants;
  static const Field<Split, List<Variant>> _f$variants = Field(
    'variants',
    _$variants,
  );
  static bool _$isFeatureGate(Split v) => v.isFeatureGate;
  static const Field<Split, bool> _f$isFeatureGate = Field(
    'isFeatureGate',
    _$isFeatureGate,
    key: r'feature_gate',
  );

  @override
  final MappableFields<Split> fields = const {
    #name: _f$name,
    #variants: _f$variants,
    #isFeatureGate: _f$isFeatureGate,
  };

  static Split _instantiate(DecodingData data) {
    return Split(
      name: data.dec(_f$name),
      variants: data.dec(_f$variants),
      isFeatureGate: data.dec(_f$isFeatureGate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Split fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Split>(map);
  }

  static Split fromJson(String json) {
    return ensureInitialized().decodeJson<Split>(json);
  }
}

mixin SplitMappable {
  String toJson() {
    return SplitMapper.ensureInitialized().encodeJson<Split>(this as Split);
  }

  Map<String, dynamic> toMap() {
    return SplitMapper.ensureInitialized().encodeMap<Split>(this as Split);
  }

  SplitCopyWith<Split, Split, Split> get copyWith =>
      _SplitCopyWithImpl<Split, Split>(this as Split, $identity, $identity);
  @override
  String toString() {
    return SplitMapper.ensureInitialized().stringifyValue(this as Split);
  }

  @override
  bool operator ==(Object other) {
    return SplitMapper.ensureInitialized().equalsValue(this as Split, other);
  }

  @override
  int get hashCode {
    return SplitMapper.ensureInitialized().hashValue(this as Split);
  }
}

extension SplitValueCopy<$R, $Out> on ObjectCopyWith<$R, Split, $Out> {
  SplitCopyWith<$R, Split, $Out> get $asSplit =>
      $base.as((v, t, t2) => _SplitCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SplitCopyWith<$R, $In extends Split, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Variant, VariantCopyWith<$R, Variant, Variant>> get variants;
  $R call({String? name, List<Variant>? variants, bool? isFeatureGate});
  SplitCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SplitCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Split, $Out>
    implements SplitCopyWith<$R, Split, $Out> {
  _SplitCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Split> $mapper = SplitMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Variant, VariantCopyWith<$R, Variant, Variant>>
  get variants => ListCopyWith(
    $value.variants,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(variants: v),
  );
  @override
  $R call({String? name, List<Variant>? variants, bool? isFeatureGate}) =>
      $apply(
        FieldCopyWithData({
          if (name != null) #name: name,
          if (variants != null) #variants: variants,
          if (isFeatureGate != null) #isFeatureGate: isFeatureGate,
        }),
      );
  @override
  Split $make(CopyWithData data) => Split(
    name: data.get(#name, or: $value.name),
    variants: data.get(#variants, or: $value.variants),
    isFeatureGate: data.get(#isFeatureGate, or: $value.isFeatureGate),
  );

  @override
  SplitCopyWith<$R2, Split, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SplitCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

