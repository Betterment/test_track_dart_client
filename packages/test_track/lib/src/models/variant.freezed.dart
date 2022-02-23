// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return _Variant.fromJson(json);
}

/// @nodoc
class _$VariantTearOff {
  const _$VariantTearOff();

  _Variant call({required String name, required int weight}) {
    return _Variant(
      name: name,
      weight: weight,
    );
  }

  Variant fromJson(Map<String, Object?> json) {
    return Variant.fromJson(json);
  }
}

/// @nodoc
const $Variant = _$VariantTearOff();

/// @nodoc
mixin _$Variant {
  String get name => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantCopyWith<Variant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantCopyWith<$Res> {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) then) =
      _$VariantCopyWithImpl<$Res>;
  $Res call({String name, int weight});
}

/// @nodoc
class _$VariantCopyWithImpl<$Res> implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._value, this._then);

  final Variant _value;
  // ignore: unused_field
  final $Res Function(Variant) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$VariantCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$VariantCopyWith(_Variant value, $Res Function(_Variant) then) =
      __$VariantCopyWithImpl<$Res>;
  @override
  $Res call({String name, int weight});
}

/// @nodoc
class __$VariantCopyWithImpl<$Res> extends _$VariantCopyWithImpl<$Res>
    implements _$VariantCopyWith<$Res> {
  __$VariantCopyWithImpl(_Variant _value, $Res Function(_Variant) _then)
      : super(_value, (v) => _then(v as _Variant));

  @override
  _Variant get _value => super._value as _Variant;

  @override
  $Res call({
    Object? name = freezed,
    Object? weight = freezed,
  }) {
    return _then(_Variant(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Variant implements _Variant {
  const _$_Variant({required this.name, required this.weight});

  factory _$_Variant.fromJson(Map<String, dynamic> json) =>
      _$$_VariantFromJson(json);

  @override
  final String name;
  @override
  final int weight;

  @override
  String toString() {
    return 'Variant(name: $name, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Variant &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$VariantCopyWith<_Variant> get copyWith =>
      __$VariantCopyWithImpl<_Variant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VariantToJson(this);
  }
}

abstract class _Variant implements Variant {
  const factory _Variant({required String name, required int weight}) =
      _$_Variant;

  factory _Variant.fromJson(Map<String, dynamic> json) = _$_Variant.fromJson;

  @override
  String get name;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$VariantCopyWith<_Variant> get copyWith =>
      throw _privateConstructorUsedError;
}
