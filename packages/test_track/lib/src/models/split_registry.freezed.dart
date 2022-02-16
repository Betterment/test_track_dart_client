// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'split_registry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SplitRegistry _$SplitRegistryFromJson(Map<String, dynamic> json) {
  return _SplitRegistry.fromJson(json);
}

/// @nodoc
class _$SplitRegistryTearOff {
  const _$SplitRegistryTearOff();

  _SplitRegistry call({required List<Split> splits}) {
    return _SplitRegistry(
      splits: splits,
    );
  }

  SplitRegistry fromJson(Map<String, Object?> json) {
    return SplitRegistry.fromJson(json);
  }
}

/// @nodoc
const $SplitRegistry = _$SplitRegistryTearOff();

/// @nodoc
mixin _$SplitRegistry {
  List<Split> get splits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SplitRegistryCopyWith<SplitRegistry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitRegistryCopyWith<$Res> {
  factory $SplitRegistryCopyWith(
          SplitRegistry value, $Res Function(SplitRegistry) then) =
      _$SplitRegistryCopyWithImpl<$Res>;
  $Res call({List<Split> splits});
}

/// @nodoc
class _$SplitRegistryCopyWithImpl<$Res>
    implements $SplitRegistryCopyWith<$Res> {
  _$SplitRegistryCopyWithImpl(this._value, this._then);

  final SplitRegistry _value;
  // ignore: unused_field
  final $Res Function(SplitRegistry) _then;

  @override
  $Res call({
    Object? splits = freezed,
  }) {
    return _then(_value.copyWith(
      splits: splits == freezed
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
    ));
  }
}

/// @nodoc
abstract class _$SplitRegistryCopyWith<$Res>
    implements $SplitRegistryCopyWith<$Res> {
  factory _$SplitRegistryCopyWith(
          _SplitRegistry value, $Res Function(_SplitRegistry) then) =
      __$SplitRegistryCopyWithImpl<$Res>;
  @override
  $Res call({List<Split> splits});
}

/// @nodoc
class __$SplitRegistryCopyWithImpl<$Res>
    extends _$SplitRegistryCopyWithImpl<$Res>
    implements _$SplitRegistryCopyWith<$Res> {
  __$SplitRegistryCopyWithImpl(
      _SplitRegistry _value, $Res Function(_SplitRegistry) _then)
      : super(_value, (v) => _then(v as _SplitRegistry));

  @override
  _SplitRegistry get _value => super._value as _SplitRegistry;

  @override
  $Res call({
    Object? splits = freezed,
  }) {
    return _then(_SplitRegistry(
      splits: splits == freezed
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SplitRegistry implements _SplitRegistry {
  _$_SplitRegistry({required this.splits});

  factory _$_SplitRegistry.fromJson(Map<String, dynamic> json) =>
      _$$_SplitRegistryFromJson(json);

  @override
  final List<Split> splits;

  @override
  String toString() {
    return 'SplitRegistry(splits: $splits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SplitRegistry &&
            const DeepCollectionEquality().equals(other.splits, splits));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(splits));

  @JsonKey(ignore: true)
  @override
  _$SplitRegistryCopyWith<_SplitRegistry> get copyWith =>
      __$SplitRegistryCopyWithImpl<_SplitRegistry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SplitRegistryToJson(this);
  }
}

abstract class _SplitRegistry implements SplitRegistry {
  factory _SplitRegistry({required List<Split> splits}) = _$_SplitRegistry;

  factory _SplitRegistry.fromJson(Map<String, dynamic> json) =
      _$_SplitRegistry.fromJson;

  @override
  List<Split> get splits;
  @override
  @JsonKey(ignore: true)
  _$SplitRegistryCopyWith<_SplitRegistry> get copyWith =>
      throw _privateConstructorUsedError;
}
