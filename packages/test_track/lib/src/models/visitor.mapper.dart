// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'visitor.dart';

class VisitorMapper extends ClassMapperBase<Visitor> {
  VisitorMapper._();

  static VisitorMapper? _instance;
  static VisitorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VisitorMapper._());
      AssignmentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Visitor';

  static List<Assignment> _$assignments(Visitor v) => v.assignments;
  static const Field<Visitor, List<Assignment>> _f$assignments = Field(
    'assignments',
    _$assignments,
  );
  static String _$id(Visitor v) => v.id;
  static const Field<Visitor, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<Visitor> fields = const {
    #assignments: _f$assignments,
    #id: _f$id,
  };

  static Visitor _instantiate(DecodingData data) {
    return Visitor(assignments: data.dec(_f$assignments), id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static Visitor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Visitor>(map);
  }

  static Visitor fromJson(String json) {
    return ensureInitialized().decodeJson<Visitor>(json);
  }
}

mixin VisitorMappable {
  String toJson() {
    return VisitorMapper.ensureInitialized().encodeJson<Visitor>(
      this as Visitor,
    );
  }

  Map<String, dynamic> toMap() {
    return VisitorMapper.ensureInitialized().encodeMap<Visitor>(
      this as Visitor,
    );
  }

  VisitorCopyWith<Visitor, Visitor, Visitor> get copyWith =>
      _VisitorCopyWithImpl<Visitor, Visitor>(
        this as Visitor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return VisitorMapper.ensureInitialized().stringifyValue(this as Visitor);
  }

  @override
  bool operator ==(Object other) {
    return VisitorMapper.ensureInitialized().equalsValue(
      this as Visitor,
      other,
    );
  }

  @override
  int get hashCode {
    return VisitorMapper.ensureInitialized().hashValue(this as Visitor);
  }
}

extension VisitorValueCopy<$R, $Out> on ObjectCopyWith<$R, Visitor, $Out> {
  VisitorCopyWith<$R, Visitor, $Out> get $asVisitor =>
      $base.as((v, t, t2) => _VisitorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VisitorCopyWith<$R, $In extends Visitor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Assignment, AssignmentCopyWith<$R, Assignment, Assignment>>
  get assignments;
  $R call({List<Assignment>? assignments, String? id});
  VisitorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VisitorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Visitor, $Out>
    implements VisitorCopyWith<$R, Visitor, $Out> {
  _VisitorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Visitor> $mapper =
      VisitorMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Assignment, AssignmentCopyWith<$R, Assignment, Assignment>>
  get assignments => ListCopyWith(
    $value.assignments,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(assignments: v),
  );
  @override
  $R call({List<Assignment>? assignments, String? id}) => $apply(
    FieldCopyWithData({
      if (assignments != null) #assignments: assignments,
      if (id != null) #id: id,
    }),
  );
  @override
  Visitor $make(CopyWithData data) => Visitor(
    assignments: data.get(#assignments, or: $value.assignments),
    id: data.get(#id, or: $value.id),
  );

  @override
  VisitorCopyWith<$R2, Visitor, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VisitorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

