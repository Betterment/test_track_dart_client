// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'assignment.dart';

class AssignmentMapper extends ClassMapperBase<Assignment> {
  AssignmentMapper._();

  static AssignmentMapper? _instance;
  static AssignmentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssignmentMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Assignment';

  static String _$splitName(Assignment v) => v.splitName;
  static const Field<Assignment, String> _f$splitName = Field(
    'splitName',
    _$splitName,
    key: r'split_name',
  );
  static String _$variant(Assignment v) => v.variant;
  static const Field<Assignment, String> _f$variant = Field(
    'variant',
    _$variant,
  );
  static String _$context(Assignment v) => v.context;
  static const Field<Assignment, String> _f$context = Field(
    'context',
    _$context,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<Assignment> fields = const {
    #splitName: _f$splitName,
    #variant: _f$variant,
    #context: _f$context,
  };

  static Assignment _instantiate(DecodingData data) {
    return Assignment(
      splitName: data.dec(_f$splitName),
      variant: data.dec(_f$variant),
      context: data.dec(_f$context),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Assignment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Assignment>(map);
  }

  static Assignment fromJson(String json) {
    return ensureInitialized().decodeJson<Assignment>(json);
  }
}

mixin AssignmentMappable {
  String toJson() {
    return AssignmentMapper.ensureInitialized().encodeJson<Assignment>(
      this as Assignment,
    );
  }

  Map<String, dynamic> toMap() {
    return AssignmentMapper.ensureInitialized().encodeMap<Assignment>(
      this as Assignment,
    );
  }

  AssignmentCopyWith<Assignment, Assignment, Assignment> get copyWith =>
      _AssignmentCopyWithImpl<Assignment, Assignment>(
        this as Assignment,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AssignmentMapper.ensureInitialized().stringifyValue(
      this as Assignment,
    );
  }

  @override
  bool operator ==(Object other) {
    return AssignmentMapper.ensureInitialized().equalsValue(
      this as Assignment,
      other,
    );
  }

  @override
  int get hashCode {
    return AssignmentMapper.ensureInitialized().hashValue(this as Assignment);
  }
}

extension AssignmentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Assignment, $Out> {
  AssignmentCopyWith<$R, Assignment, $Out> get $asAssignment =>
      $base.as((v, t, t2) => _AssignmentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AssignmentCopyWith<$R, $In extends Assignment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? splitName, String? variant, String? context});
  AssignmentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AssignmentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Assignment, $Out>
    implements AssignmentCopyWith<$R, Assignment, $Out> {
  _AssignmentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Assignment> $mapper =
      AssignmentMapper.ensureInitialized();
  @override
  $R call({String? splitName, String? variant, String? context}) => $apply(
    FieldCopyWithData({
      if (splitName != null) #splitName: splitName,
      if (variant != null) #variant: variant,
      if (context != null) #context: context,
    }),
  );
  @override
  Assignment $make(CopyWithData data) => Assignment(
    splitName: data.get(#splitName, or: $value.splitName),
    variant: data.get(#variant, or: $value.variant),
    context: data.get(#context, or: $value.context),
  );

  @override
  AssignmentCopyWith<$R2, Assignment, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AssignmentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

