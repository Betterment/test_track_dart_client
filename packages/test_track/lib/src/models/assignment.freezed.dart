// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return _Assignment.fromJson(json);
}

/// @nodoc
mixin _$Assignment {
  String get splitName => throw _privateConstructorUsedError;
  String get variant => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignmentCopyWith<Assignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentCopyWith<$Res> {
  factory $AssignmentCopyWith(
          Assignment value, $Res Function(Assignment) then) =
      _$AssignmentCopyWithImpl<$Res, Assignment>;
  @useResult
  $Res call({String splitName, String variant, String context});
}

/// @nodoc
class _$AssignmentCopyWithImpl<$Res, $Val extends Assignment>
    implements $AssignmentCopyWith<$Res> {
  _$AssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitName = null,
    Object? variant = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      splitName: null == splitName
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssignmentCopyWith<$Res>
    implements $AssignmentCopyWith<$Res> {
  factory _$$_AssignmentCopyWith(
          _$_Assignment value, $Res Function(_$_Assignment) then) =
      __$$_AssignmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String splitName, String variant, String context});
}

/// @nodoc
class __$$_AssignmentCopyWithImpl<$Res>
    extends _$AssignmentCopyWithImpl<$Res, _$_Assignment>
    implements _$$_AssignmentCopyWith<$Res> {
  __$$_AssignmentCopyWithImpl(
      _$_Assignment _value, $Res Function(_$_Assignment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitName = null,
    Object? variant = null,
    Object? context = null,
  }) {
    return _then(_$_Assignment(
      splitName: null == splitName
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
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
class _$_Assignment implements _Assignment {
  const _$_Assignment(
      {required this.splitName, required this.variant, this.context = ''});

  factory _$_Assignment.fromJson(Map<String, dynamic> json) =>
      _$$_AssignmentFromJson(json);

  @override
  final String splitName;
  @override
  final String variant;
  @override
  @JsonKey()
  final String context;

  @override
  String toString() {
    return 'Assignment(splitName: $splitName, variant: $variant, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Assignment &&
            (identical(other.splitName, splitName) ||
                other.splitName == splitName) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, splitName, variant, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssignmentCopyWith<_$_Assignment> get copyWith =>
      __$$_AssignmentCopyWithImpl<_$_Assignment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignmentToJson(
      this,
    );
  }
}

abstract class _Assignment implements Assignment {
  const factory _Assignment(
      {required final String splitName,
      required final String variant,
      final String context}) = _$_Assignment;

  factory _Assignment.fromJson(Map<String, dynamic> json) =
      _$_Assignment.fromJson;

  @override
  String get splitName;
  @override
  String get variant;
  @override
  String get context;
  @override
  @JsonKey(ignore: true)
  _$$_AssignmentCopyWith<_$_Assignment> get copyWith =>
      throw _privateConstructorUsedError;
}
