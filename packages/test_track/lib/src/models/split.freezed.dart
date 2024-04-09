// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Split _$SplitFromJson(Map<String, dynamic> json) {
  return _Split.fromJson(json);
}

/// @nodoc
mixin _$Split {
  String get name => throw _privateConstructorUsedError;
  List<Variant> get variants => throw _privateConstructorUsedError;
  @JsonKey(name: 'feature_gate')
  bool get isFeatureGate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SplitCopyWith<Split> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitCopyWith<$Res> {
  factory $SplitCopyWith(Split value, $Res Function(Split) then) =
      _$SplitCopyWithImpl<$Res, Split>;
  @useResult
  $Res call(
      {String name,
      List<Variant> variants,
      @JsonKey(name: 'feature_gate') bool isFeatureGate});
}

/// @nodoc
class _$SplitCopyWithImpl<$Res, $Val extends Split>
    implements $SplitCopyWith<$Res> {
  _$SplitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? variants = null,
    Object? isFeatureGate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      isFeatureGate: null == isFeatureGate
          ? _value.isFeatureGate
          : isFeatureGate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplitImplCopyWith<$Res> implements $SplitCopyWith<$Res> {
  factory _$$SplitImplCopyWith(
          _$SplitImpl value, $Res Function(_$SplitImpl) then) =
      __$$SplitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<Variant> variants,
      @JsonKey(name: 'feature_gate') bool isFeatureGate});
}

/// @nodoc
class __$$SplitImplCopyWithImpl<$Res>
    extends _$SplitCopyWithImpl<$Res, _$SplitImpl>
    implements _$$SplitImplCopyWith<$Res> {
  __$$SplitImplCopyWithImpl(
      _$SplitImpl _value, $Res Function(_$SplitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? variants = null,
    Object? isFeatureGate = null,
  }) {
    return _then(_$SplitImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      isFeatureGate: null == isFeatureGate
          ? _value.isFeatureGate
          : isFeatureGate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplitImpl implements _Split {
  const _$SplitImpl(
      {required this.name,
      required final List<Variant> variants,
      @JsonKey(name: 'feature_gate') required this.isFeatureGate})
      : _variants = variants;

  factory _$SplitImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplitImplFromJson(json);

  @override
  final String name;
  final List<Variant> _variants;
  @override
  List<Variant> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  @override
  @JsonKey(name: 'feature_gate')
  final bool isFeatureGate;

  @override
  String toString() {
    return 'Split(name: $name, variants: $variants, isFeatureGate: $isFeatureGate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.isFeatureGate, isFeatureGate) ||
                other.isFeatureGate == isFeatureGate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_variants), isFeatureGate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitImplCopyWith<_$SplitImpl> get copyWith =>
      __$$SplitImplCopyWithImpl<_$SplitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplitImplToJson(
      this,
    );
  }
}

abstract class _Split implements Split {
  const factory _Split(
          {required final String name,
          required final List<Variant> variants,
          @JsonKey(name: 'feature_gate') required final bool isFeatureGate}) =
      _$SplitImpl;

  factory _Split.fromJson(Map<String, dynamic> json) = _$SplitImpl.fromJson;

  @override
  String get name;
  @override
  List<Variant> get variants;
  @override
  @JsonKey(name: 'feature_gate')
  bool get isFeatureGate;
  @override
  @JsonKey(ignore: true)
  _$$SplitImplCopyWith<_$SplitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
