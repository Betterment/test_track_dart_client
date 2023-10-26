// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Identifier _$IdentifierFromJson(Map<String, dynamic> json) {
  return _Identifier.fromJson(json);
}

/// @nodoc
mixin _$Identifier {
  String get identifierType => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentifierCopyWith<Identifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifierCopyWith<$Res> {
  factory $IdentifierCopyWith(
          Identifier value, $Res Function(Identifier) then) =
      _$IdentifierCopyWithImpl<$Res, Identifier>;
  @useResult
  $Res call({String identifierType, String value});
}

/// @nodoc
class _$IdentifierCopyWithImpl<$Res, $Val extends Identifier>
    implements $IdentifierCopyWith<$Res> {
  _$IdentifierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifierType = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      identifierType: null == identifierType
          ? _value.identifierType
          : identifierType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentifierImplCopyWith<$Res>
    implements $IdentifierCopyWith<$Res> {
  factory _$$IdentifierImplCopyWith(
          _$IdentifierImpl value, $Res Function(_$IdentifierImpl) then) =
      __$$IdentifierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifierType, String value});
}

/// @nodoc
class __$$IdentifierImplCopyWithImpl<$Res>
    extends _$IdentifierCopyWithImpl<$Res, _$IdentifierImpl>
    implements _$$IdentifierImplCopyWith<$Res> {
  __$$IdentifierImplCopyWithImpl(
      _$IdentifierImpl _value, $Res Function(_$IdentifierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifierType = null,
    Object? value = null,
  }) {
    return _then(_$IdentifierImpl(
      identifierType: null == identifierType
          ? _value.identifierType
          : identifierType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentifierImpl implements _Identifier {
  const _$IdentifierImpl({required this.identifierType, required this.value});

  factory _$IdentifierImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentifierImplFromJson(json);

  @override
  final String identifierType;
  @override
  final String value;

  @override
  String toString() {
    return 'Identifier(identifierType: $identifierType, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentifierImpl &&
            (identical(other.identifierType, identifierType) ||
                other.identifierType == identifierType) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identifierType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentifierImplCopyWith<_$IdentifierImpl> get copyWith =>
      __$$IdentifierImplCopyWithImpl<_$IdentifierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentifierImplToJson(
      this,
    );
  }
}

abstract class _Identifier implements Identifier {
  const factory _Identifier(
      {required final String identifierType,
      required final String value}) = _$IdentifierImpl;

  factory _Identifier.fromJson(Map<String, dynamic> json) =
      _$IdentifierImpl.fromJson;

  @override
  String get identifierType;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$IdentifierImplCopyWith<_$IdentifierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
