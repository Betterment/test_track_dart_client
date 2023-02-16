// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_registry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SplitRegistry _$SplitRegistryFromJson(Map<String, dynamic> json) {
  return _SplitRegistry.fromJson(json);
}

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
      _$SplitRegistryCopyWithImpl<$Res, SplitRegistry>;
  @useResult
  $Res call({List<Split> splits});
}

/// @nodoc
class _$SplitRegistryCopyWithImpl<$Res, $Val extends SplitRegistry>
    implements $SplitRegistryCopyWith<$Res> {
  _$SplitRegistryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splits = null,
  }) {
    return _then(_value.copyWith(
      splits: null == splits
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SplitRegistryCopyWith<$Res>
    implements $SplitRegistryCopyWith<$Res> {
  factory _$$_SplitRegistryCopyWith(
          _$_SplitRegistry value, $Res Function(_$_SplitRegistry) then) =
      __$$_SplitRegistryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Split> splits});
}

/// @nodoc
class __$$_SplitRegistryCopyWithImpl<$Res>
    extends _$SplitRegistryCopyWithImpl<$Res, _$_SplitRegistry>
    implements _$$_SplitRegistryCopyWith<$Res> {
  __$$_SplitRegistryCopyWithImpl(
      _$_SplitRegistry _value, $Res Function(_$_SplitRegistry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splits = null,
  }) {
    return _then(_$_SplitRegistry(
      splits: null == splits
          ? _value._splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SplitRegistry implements _SplitRegistry {
  _$_SplitRegistry({required final List<Split> splits}) : _splits = splits;

  factory _$_SplitRegistry.fromJson(Map<String, dynamic> json) =>
      _$$_SplitRegistryFromJson(json);

  final List<Split> _splits;
  @override
  List<Split> get splits {
    if (_splits is EqualUnmodifiableListView) return _splits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_splits);
  }

  @override
  String toString() {
    return 'SplitRegistry(splits: $splits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SplitRegistry &&
            const DeepCollectionEquality().equals(other._splits, _splits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_splits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SplitRegistryCopyWith<_$_SplitRegistry> get copyWith =>
      __$$_SplitRegistryCopyWithImpl<_$_SplitRegistry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SplitRegistryToJson(
      this,
    );
  }
}

abstract class _SplitRegistry implements SplitRegistry {
  factory _SplitRegistry({required final List<Split> splits}) =
      _$_SplitRegistry;

  factory _SplitRegistry.fromJson(Map<String, dynamic> json) =
      _$_SplitRegistry.fromJson;

  @override
  List<Split> get splits;
  @override
  @JsonKey(ignore: true)
  _$$_SplitRegistryCopyWith<_$_SplitRegistry> get copyWith =>
      throw _privateConstructorUsedError;
}
