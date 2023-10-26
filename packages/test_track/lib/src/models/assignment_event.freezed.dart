// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssignmentEvent _$AssignmentEventFromJson(Map<String, dynamic> json) {
  return _AssignmentEvent.fromJson(json);
}

/// @nodoc
mixin _$AssignmentEvent {
  String get visitorId => throw _privateConstructorUsedError;
  String get splitName => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignmentEventCopyWith<AssignmentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentEventCopyWith<$Res> {
  factory $AssignmentEventCopyWith(
          AssignmentEvent value, $Res Function(AssignmentEvent) then) =
      _$AssignmentEventCopyWithImpl<$Res, AssignmentEvent>;
  @useResult
  $Res call({String visitorId, String splitName, String context});
}

/// @nodoc
class _$AssignmentEventCopyWithImpl<$Res, $Val extends AssignmentEvent>
    implements $AssignmentEventCopyWith<$Res> {
  _$AssignmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorId = null,
    Object? splitName = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      visitorId: null == visitorId
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      splitName: null == splitName
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentEventImplCopyWith<$Res>
    implements $AssignmentEventCopyWith<$Res> {
  factory _$$AssignmentEventImplCopyWith(_$AssignmentEventImpl value,
          $Res Function(_$AssignmentEventImpl) then) =
      __$$AssignmentEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String visitorId, String splitName, String context});
}

/// @nodoc
class __$$AssignmentEventImplCopyWithImpl<$Res>
    extends _$AssignmentEventCopyWithImpl<$Res, _$AssignmentEventImpl>
    implements _$$AssignmentEventImplCopyWith<$Res> {
  __$$AssignmentEventImplCopyWithImpl(
      _$AssignmentEventImpl _value, $Res Function(_$AssignmentEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitorId = null,
    Object? splitName = null,
    Object? context = null,
  }) {
    return _then(_$AssignmentEventImpl(
      visitorId: null == visitorId
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      splitName: null == splitName
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignmentEventImpl implements _AssignmentEvent {
  const _$AssignmentEventImpl(
      {required this.visitorId,
      required this.splitName,
      required this.context});

  factory _$AssignmentEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignmentEventImplFromJson(json);

  @override
  final String visitorId;
  @override
  final String splitName;
  @override
  final String context;

  @override
  String toString() {
    return 'AssignmentEvent(visitorId: $visitorId, splitName: $splitName, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentEventImpl &&
            (identical(other.visitorId, visitorId) ||
                other.visitorId == visitorId) &&
            (identical(other.splitName, splitName) ||
                other.splitName == splitName) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, visitorId, splitName, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentEventImplCopyWith<_$AssignmentEventImpl> get copyWith =>
      __$$AssignmentEventImplCopyWithImpl<_$AssignmentEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignmentEventImplToJson(
      this,
    );
  }
}

abstract class _AssignmentEvent implements AssignmentEvent {
  const factory _AssignmentEvent(
      {required final String visitorId,
      required final String splitName,
      required final String context}) = _$AssignmentEventImpl;

  factory _AssignmentEvent.fromJson(Map<String, dynamic> json) =
      _$AssignmentEventImpl.fromJson;

  @override
  String get visitorId;
  @override
  String get splitName;
  @override
  String get context;
  @override
  @JsonKey(ignore: true)
  _$$AssignmentEventImplCopyWith<_$AssignmentEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
