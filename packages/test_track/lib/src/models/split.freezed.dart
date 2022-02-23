// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'split.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Split _$SplitFromJson(Map<String, dynamic> json) {
  return _Split.fromJson(json);
}

/// @nodoc
class _$SplitTearOff {
  const _$SplitTearOff();

  _Split call(
      {required String name,
      required List<Variant> variants,
      @JsonKey(name: 'feature_gate') required bool isFeatureGate}) {
    return _Split(
      name: name,
      variants: variants,
      isFeatureGate: isFeatureGate,
    );
  }

  Split fromJson(Map<String, Object?> json) {
    return Split.fromJson(json);
  }
}

/// @nodoc
const $Split = _$SplitTearOff();

/// @nodoc
mixin _$Split {
  String get name => throw _privateConstructorUsedError;
  List<Variant> get variants =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'feature_gate')
  bool get isFeatureGate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SplitCopyWith<Split> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitCopyWith<$Res> {
  factory $SplitCopyWith(Split value, $Res Function(Split) then) =
      _$SplitCopyWithImpl<$Res>;
  $Res call(
      {String name,
      List<Variant> variants,
      @JsonKey(name: 'feature_gate') bool isFeatureGate});
}

/// @nodoc
class _$SplitCopyWithImpl<$Res> implements $SplitCopyWith<$Res> {
  _$SplitCopyWithImpl(this._value, this._then);

  final Split _value;
  // ignore: unused_field
  final $Res Function(Split) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? variants = freezed,
    Object? isFeatureGate = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      isFeatureGate: isFeatureGate == freezed
          ? _value.isFeatureGate
          : isFeatureGate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SplitCopyWith<$Res> implements $SplitCopyWith<$Res> {
  factory _$SplitCopyWith(_Split value, $Res Function(_Split) then) =
      __$SplitCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      List<Variant> variants,
      @JsonKey(name: 'feature_gate') bool isFeatureGate});
}

/// @nodoc
class __$SplitCopyWithImpl<$Res> extends _$SplitCopyWithImpl<$Res>
    implements _$SplitCopyWith<$Res> {
  __$SplitCopyWithImpl(_Split _value, $Res Function(_Split) _then)
      : super(_value, (v) => _then(v as _Split));

  @override
  _Split get _value => super._value as _Split;

  @override
  $Res call({
    Object? name = freezed,
    Object? variants = freezed,
    Object? isFeatureGate = freezed,
  }) {
    return _then(_Split(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      isFeatureGate: isFeatureGate == freezed
          ? _value.isFeatureGate
          : isFeatureGate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Split implements _Split {
  const _$_Split(
      {required this.name,
      required this.variants,
      @JsonKey(name: 'feature_gate') required this.isFeatureGate});

  factory _$_Split.fromJson(Map<String, dynamic> json) =>
      _$$_SplitFromJson(json);

  @override
  final String name;
  @override
  final List<Variant> variants;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'feature_gate')
  final bool isFeatureGate;

  @override
  String toString() {
    return 'Split(name: $name, variants: $variants, isFeatureGate: $isFeatureGate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Split &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.variants, variants) &&
            const DeepCollectionEquality()
                .equals(other.isFeatureGate, isFeatureGate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(variants),
      const DeepCollectionEquality().hash(isFeatureGate));

  @JsonKey(ignore: true)
  @override
  _$SplitCopyWith<_Split> get copyWith =>
      __$SplitCopyWithImpl<_Split>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SplitToJson(this);
  }
}

abstract class _Split implements Split {
  const factory _Split(
      {required String name,
      required List<Variant> variants,
      @JsonKey(name: 'feature_gate') required bool isFeatureGate}) = _$_Split;

  factory _Split.fromJson(Map<String, dynamic> json) = _$_Split.fromJson;

  @override
  String get name;
  @override
  List<Variant> get variants;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'feature_gate')
  bool get isFeatureGate;
  @override
  @JsonKey(ignore: true)
  _$SplitCopyWith<_Split> get copyWith => throw _privateConstructorUsedError;
}
