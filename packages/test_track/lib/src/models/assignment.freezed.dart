// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return _Assignment.fromJson(json);
}

/// @nodoc
class _$AssignmentTearOff {
  const _$AssignmentTearOff();

  _Assignment call(
      {required String splitName,
      required String variant,
      String context = ''}) {
    return _Assignment(
      splitName: splitName,
      variant: variant,
      context: context,
    );
  }

  Assignment fromJson(Map<String, Object?> json) {
    return Assignment.fromJson(json);
  }
}

/// @nodoc
const $Assignment = _$AssignmentTearOff();

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
      _$AssignmentCopyWithImpl<$Res>;
  $Res call({String splitName, String variant, String context});
}

/// @nodoc
class _$AssignmentCopyWithImpl<$Res> implements $AssignmentCopyWith<$Res> {
  _$AssignmentCopyWithImpl(this._value, this._then);

  final Assignment _value;
  // ignore: unused_field
  final $Res Function(Assignment) _then;

  @override
  $Res call({
    Object? splitName = freezed,
    Object? variant = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      splitName: splitName == freezed
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AssignmentCopyWith<$Res> implements $AssignmentCopyWith<$Res> {
  factory _$AssignmentCopyWith(
          _Assignment value, $Res Function(_Assignment) then) =
      __$AssignmentCopyWithImpl<$Res>;
  @override
  $Res call({String splitName, String variant, String context});
}

/// @nodoc
class __$AssignmentCopyWithImpl<$Res> extends _$AssignmentCopyWithImpl<$Res>
    implements _$AssignmentCopyWith<$Res> {
  __$AssignmentCopyWithImpl(
      _Assignment _value, $Res Function(_Assignment) _then)
      : super(_value, (v) => _then(v as _Assignment));

  @override
  _Assignment get _value => super._value as _Assignment;

  @override
  $Res call({
    Object? splitName = freezed,
    Object? variant = freezed,
    Object? context = freezed,
  }) {
    return _then(_Assignment(
      splitName: splitName == freezed
          ? _value.splitName
          : splitName // ignore: cast_nullable_to_non_nullable
              as String,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
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
class _$_Assignment implements _Assignment {
  const _$_Assignment(
      {required this.splitName, required this.variant, this.context = ''});

  factory _$_Assignment.fromJson(Map<String, dynamic> json) =>
      _$$_AssignmentFromJson(json);

  @override
  final String splitName;
  @override
  final String variant;
  @JsonKey(defaultValue: '')
  @override
  final String context;

  @override
  String toString() {
    return 'Assignment(splitName: $splitName, variant: $variant, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Assignment &&
            const DeepCollectionEquality().equals(other.splitName, splitName) &&
            const DeepCollectionEquality().equals(other.variant, variant) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(splitName),
      const DeepCollectionEquality().hash(variant),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$AssignmentCopyWith<_Assignment> get copyWith =>
      __$AssignmentCopyWithImpl<_Assignment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignmentToJson(this);
  }
}

abstract class _Assignment implements Assignment {
  const factory _Assignment(
      {required String splitName,
      required String variant,
      String context}) = _$_Assignment;

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
  _$AssignmentCopyWith<_Assignment> get copyWith =>
      throw _privateConstructorUsedError;
}
