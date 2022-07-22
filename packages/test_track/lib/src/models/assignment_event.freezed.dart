// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$AssignmentEventCopyWithImpl<$Res>;
  $Res call({String visitorId, String splitName, String context});
}

/// @nodoc
class _$AssignmentEventCopyWithImpl<$Res>
    implements $AssignmentEventCopyWith<$Res> {
  _$AssignmentEventCopyWithImpl(this._value, this._then);

  final AssignmentEvent _value;
  // ignore: unused_field
  final $Res Function(AssignmentEvent) _then;

  @override
  $Res call({
    Object? visitorId = freezed,
    Object? splitName = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      visitorId: visitorId == freezed
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      splitName: splitName == freezed
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AssignmentEventCopyWith<$Res>
    implements $AssignmentEventCopyWith<$Res> {
  factory _$$_AssignmentEventCopyWith(
          _$_AssignmentEvent value, $Res Function(_$_AssignmentEvent) then) =
      __$$_AssignmentEventCopyWithImpl<$Res>;
  @override
  $Res call({String visitorId, String splitName, String context});
}

/// @nodoc
class __$$_AssignmentEventCopyWithImpl<$Res>
    extends _$AssignmentEventCopyWithImpl<$Res>
    implements _$$_AssignmentEventCopyWith<$Res> {
  __$$_AssignmentEventCopyWithImpl(
      _$_AssignmentEvent _value, $Res Function(_$_AssignmentEvent) _then)
      : super(_value, (v) => _then(v as _$_AssignmentEvent));

  @override
  _$_AssignmentEvent get _value => super._value as _$_AssignmentEvent;

  @override
  $Res call({
    Object? visitorId = freezed,
    Object? splitName = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_AssignmentEvent(
      visitorId: visitorId == freezed
          ? _value.visitorId
          : visitorId // ignore: cast_nullable_to_non_nullable
              as String,
      splitName: splitName == freezed
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssignmentEvent implements _AssignmentEvent {
  const _$_AssignmentEvent(
      {required this.visitorId,
      required this.splitName,
      required this.context});

  factory _$_AssignmentEvent.fromJson(Map<String, dynamic> json) =>
      _$$_AssignmentEventFromJson(json);

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
            other is _$_AssignmentEvent &&
            const DeepCollectionEquality().equals(other.visitorId, visitorId) &&
            const DeepCollectionEquality().equals(other.splitName, splitName) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(visitorId),
      const DeepCollectionEquality().hash(splitName),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_AssignmentEventCopyWith<_$_AssignmentEvent> get copyWith =>
      __$$_AssignmentEventCopyWithImpl<_$_AssignmentEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignmentEventToJson(
      this,
    );
  }
}

abstract class _AssignmentEvent implements AssignmentEvent {
  const factory _AssignmentEvent(
      {required final String visitorId,
      required final String splitName,
      required final String context}) = _$_AssignmentEvent;

  factory _AssignmentEvent.fromJson(Map<String, dynamic> json) =
      _$_AssignmentEvent.fromJson;

  @override
  String get visitorId;
  @override
  String get splitName;
  @override
  String get context;
  @override
  @JsonKey(ignore: true)
  _$$_AssignmentEventCopyWith<_$_AssignmentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
