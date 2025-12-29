// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'assignment_event.dart';

class AssignmentEventMapper extends ClassMapperBase<AssignmentEvent> {
  AssignmentEventMapper._();

  static AssignmentEventMapper? _instance;
  static AssignmentEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssignmentEventMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AssignmentEvent';

  static String _$visitorId(AssignmentEvent v) => v.visitorId;
  static const Field<AssignmentEvent, String> _f$visitorId = Field(
    'visitorId',
    _$visitorId,
    key: r'visitor_id',
  );
  static String _$splitName(AssignmentEvent v) => v.splitName;
  static const Field<AssignmentEvent, String> _f$splitName = Field(
    'splitName',
    _$splitName,
    key: r'split_name',
  );
  static String _$context(AssignmentEvent v) => v.context;
  static const Field<AssignmentEvent, String> _f$context = Field(
    'context',
    _$context,
  );

  @override
  final MappableFields<AssignmentEvent> fields = const {
    #visitorId: _f$visitorId,
    #splitName: _f$splitName,
    #context: _f$context,
  };

  static AssignmentEvent _instantiate(DecodingData data) {
    return AssignmentEvent(
      visitorId: data.dec(_f$visitorId),
      splitName: data.dec(_f$splitName),
      context: data.dec(_f$context),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AssignmentEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AssignmentEvent>(map);
  }

  static AssignmentEvent fromJson(String json) {
    return ensureInitialized().decodeJson<AssignmentEvent>(json);
  }
}

mixin AssignmentEventMappable {
  String toJson() {
    return AssignmentEventMapper.ensureInitialized()
        .encodeJson<AssignmentEvent>(this as AssignmentEvent);
  }

  Map<String, dynamic> toMap() {
    return AssignmentEventMapper.ensureInitialized().encodeMap<AssignmentEvent>(
      this as AssignmentEvent,
    );
  }

  AssignmentEventCopyWith<AssignmentEvent, AssignmentEvent, AssignmentEvent>
  get copyWith =>
      _AssignmentEventCopyWithImpl<AssignmentEvent, AssignmentEvent>(
        this as AssignmentEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AssignmentEventMapper.ensureInitialized().stringifyValue(
      this as AssignmentEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return AssignmentEventMapper.ensureInitialized().equalsValue(
      this as AssignmentEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return AssignmentEventMapper.ensureInitialized().hashValue(
      this as AssignmentEvent,
    );
  }
}

extension AssignmentEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AssignmentEvent, $Out> {
  AssignmentEventCopyWith<$R, AssignmentEvent, $Out> get $asAssignmentEvent =>
      $base.as((v, t, t2) => _AssignmentEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AssignmentEventCopyWith<$R, $In extends AssignmentEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? visitorId, String? splitName, String? context});
  AssignmentEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AssignmentEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AssignmentEvent, $Out>
    implements AssignmentEventCopyWith<$R, AssignmentEvent, $Out> {
  _AssignmentEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AssignmentEvent> $mapper =
      AssignmentEventMapper.ensureInitialized();
  @override
  $R call({String? visitorId, String? splitName, String? context}) => $apply(
    FieldCopyWithData({
      if (visitorId != null) #visitorId: visitorId,
      if (splitName != null) #splitName: splitName,
      if (context != null) #context: context,
    }),
  );
  @override
  AssignmentEvent $make(CopyWithData data) => AssignmentEvent(
    visitorId: data.get(#visitorId, or: $value.visitorId),
    splitName: data.get(#splitName, or: $value.splitName),
    context: data.get(#context, or: $value.context),
  );

  @override
  AssignmentEventCopyWith<$R2, AssignmentEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AssignmentEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

