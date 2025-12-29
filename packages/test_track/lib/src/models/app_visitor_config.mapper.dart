// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_visitor_config.dart';

class AppVisitorConfigMapper extends ClassMapperBase<AppVisitorConfig> {
  AppVisitorConfigMapper._();

  static AppVisitorConfigMapper? _instance;
  static AppVisitorConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppVisitorConfigMapper._());
      SplitMapper.ensureInitialized();
      VisitorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppVisitorConfig';

  static List<Split> _$splits(AppVisitorConfig v) => v.splits;
  static const Field<AppVisitorConfig, List<Split>> _f$splits = Field(
    'splits',
    _$splits,
  );
  static Visitor _$visitor(AppVisitorConfig v) => v.visitor;
  static const Field<AppVisitorConfig, Visitor> _f$visitor = Field(
    'visitor',
    _$visitor,
  );

  @override
  final MappableFields<AppVisitorConfig> fields = const {
    #splits: _f$splits,
    #visitor: _f$visitor,
  };

  static AppVisitorConfig _instantiate(DecodingData data) {
    return AppVisitorConfig(
      splits: data.dec(_f$splits),
      visitor: data.dec(_f$visitor),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppVisitorConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppVisitorConfig>(map);
  }

  static AppVisitorConfig fromJson(String json) {
    return ensureInitialized().decodeJson<AppVisitorConfig>(json);
  }
}

mixin AppVisitorConfigMappable {
  String toJson() {
    return AppVisitorConfigMapper.ensureInitialized()
        .encodeJson<AppVisitorConfig>(this as AppVisitorConfig);
  }

  Map<String, dynamic> toMap() {
    return AppVisitorConfigMapper.ensureInitialized()
        .encodeMap<AppVisitorConfig>(this as AppVisitorConfig);
  }

  AppVisitorConfigCopyWith<AppVisitorConfig, AppVisitorConfig, AppVisitorConfig>
  get copyWith =>
      _AppVisitorConfigCopyWithImpl<AppVisitorConfig, AppVisitorConfig>(
        this as AppVisitorConfig,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppVisitorConfigMapper.ensureInitialized().stringifyValue(
      this as AppVisitorConfig,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppVisitorConfigMapper.ensureInitialized().equalsValue(
      this as AppVisitorConfig,
      other,
    );
  }

  @override
  int get hashCode {
    return AppVisitorConfigMapper.ensureInitialized().hashValue(
      this as AppVisitorConfig,
    );
  }
}

extension AppVisitorConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppVisitorConfig, $Out> {
  AppVisitorConfigCopyWith<$R, AppVisitorConfig, $Out>
  get $asAppVisitorConfig =>
      $base.as((v, t, t2) => _AppVisitorConfigCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppVisitorConfigCopyWith<$R, $In extends AppVisitorConfig, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Split, SplitCopyWith<$R, Split, Split>> get splits;
  VisitorCopyWith<$R, Visitor, Visitor> get visitor;
  $R call({List<Split>? splits, Visitor? visitor});
  AppVisitorConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppVisitorConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppVisitorConfig, $Out>
    implements AppVisitorConfigCopyWith<$R, AppVisitorConfig, $Out> {
  _AppVisitorConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppVisitorConfig> $mapper =
      AppVisitorConfigMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Split, SplitCopyWith<$R, Split, Split>> get splits =>
      ListCopyWith(
        $value.splits,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(splits: v),
      );
  @override
  VisitorCopyWith<$R, Visitor, Visitor> get visitor =>
      $value.visitor.copyWith.$chain((v) => call(visitor: v));
  @override
  $R call({List<Split>? splits, Visitor? visitor}) => $apply(
    FieldCopyWithData({
      if (splits != null) #splits: splits,
      if (visitor != null) #visitor: visitor,
    }),
  );
  @override
  AppVisitorConfig $make(CopyWithData data) => AppVisitorConfig(
    splits: data.get(#splits, or: $value.splits),
    visitor: data.get(#visitor, or: $value.visitor),
  );

  @override
  AppVisitorConfigCopyWith<$R2, AppVisitorConfig, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppVisitorConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

