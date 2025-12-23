// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'split_registry.dart';

class SplitRegistryMapper extends ClassMapperBase<SplitRegistry> {
  SplitRegistryMapper._();

  static SplitRegistryMapper? _instance;
  static SplitRegistryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SplitRegistryMapper._());
      SplitMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SplitRegistry';

  static List<Split> _$splits(SplitRegistry v) => v.splits;
  static const Field<SplitRegistry, List<Split>> _f$splits = Field(
    'splits',
    _$splits,
  );

  @override
  final MappableFields<SplitRegistry> fields = const {#splits: _f$splits};

  static SplitRegistry _instantiate(DecodingData data) {
    return SplitRegistry(splits: data.dec(_f$splits));
  }

  @override
  final Function instantiate = _instantiate;

  static SplitRegistry fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SplitRegistry>(map);
  }

  static SplitRegistry fromJson(String json) {
    return ensureInitialized().decodeJson<SplitRegistry>(json);
  }
}

mixin SplitRegistryMappable {
  String toJson() {
    return SplitRegistryMapper.ensureInitialized().encodeJson<SplitRegistry>(
      this as SplitRegistry,
    );
  }

  Map<String, dynamic> toMap() {
    return SplitRegistryMapper.ensureInitialized().encodeMap<SplitRegistry>(
      this as SplitRegistry,
    );
  }

  SplitRegistryCopyWith<SplitRegistry, SplitRegistry, SplitRegistry>
  get copyWith => _SplitRegistryCopyWithImpl<SplitRegistry, SplitRegistry>(
    this as SplitRegistry,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SplitRegistryMapper.ensureInitialized().stringifyValue(
      this as SplitRegistry,
    );
  }

  @override
  bool operator ==(Object other) {
    return SplitRegistryMapper.ensureInitialized().equalsValue(
      this as SplitRegistry,
      other,
    );
  }

  @override
  int get hashCode {
    return SplitRegistryMapper.ensureInitialized().hashValue(
      this as SplitRegistry,
    );
  }
}

extension SplitRegistryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SplitRegistry, $Out> {
  SplitRegistryCopyWith<$R, SplitRegistry, $Out> get $asSplitRegistry =>
      $base.as((v, t, t2) => _SplitRegistryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SplitRegistryCopyWith<$R, $In extends SplitRegistry, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Split, SplitCopyWith<$R, Split, Split>> get splits;
  $R call({List<Split>? splits});
  SplitRegistryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SplitRegistryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SplitRegistry, $Out>
    implements SplitRegistryCopyWith<$R, SplitRegistry, $Out> {
  _SplitRegistryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SplitRegistry> $mapper =
      SplitRegistryMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Split, SplitCopyWith<$R, Split, Split>> get splits =>
      ListCopyWith(
        $value.splits,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(splits: v),
      );
  @override
  $R call({List<Split>? splits}) =>
      $apply(FieldCopyWithData({if (splits != null) #splits: splits}));
  @override
  SplitRegistry $make(CopyWithData data) =>
      SplitRegistry(splits: data.get(#splits, or: $value.splits));

  @override
  SplitRegistryCopyWith<$R2, SplitRegistry, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SplitRegistryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

