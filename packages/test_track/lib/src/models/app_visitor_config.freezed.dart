// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_visitor_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppVisitorConfig _$AppVisitorConfigFromJson(Map<String, dynamic> json) {
  return _AppVisitorConfig.fromJson(json);
}

/// @nodoc
class _$AppVisitorConfigTearOff {
  const _$AppVisitorConfigTearOff();

  _AppVisitorConfig call(
      {required List<Split> splits, required Visitor visitor}) {
    return _AppVisitorConfig(
      splits: splits,
      visitor: visitor,
    );
  }

  AppVisitorConfig fromJson(Map<String, Object?> json) {
    return AppVisitorConfig.fromJson(json);
  }
}

/// @nodoc
const $AppVisitorConfig = _$AppVisitorConfigTearOff();

/// @nodoc
mixin _$AppVisitorConfig {
  List<Split> get splits => throw _privateConstructorUsedError;
  Visitor get visitor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVisitorConfigCopyWith<AppVisitorConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVisitorConfigCopyWith<$Res> {
  factory $AppVisitorConfigCopyWith(
          AppVisitorConfig value, $Res Function(AppVisitorConfig) then) =
      _$AppVisitorConfigCopyWithImpl<$Res>;
  $Res call({List<Split> splits, Visitor visitor});

  $VisitorCopyWith<$Res> get visitor;
}

/// @nodoc
class _$AppVisitorConfigCopyWithImpl<$Res>
    implements $AppVisitorConfigCopyWith<$Res> {
  _$AppVisitorConfigCopyWithImpl(this._value, this._then);

  final AppVisitorConfig _value;
  // ignore: unused_field
  final $Res Function(AppVisitorConfig) _then;

  @override
  $Res call({
    Object? splits = freezed,
    Object? visitor = freezed,
  }) {
    return _then(_value.copyWith(
      splits: splits == freezed
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
      visitor: visitor == freezed
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Visitor,
    ));
  }

  @override
  $VisitorCopyWith<$Res> get visitor {
    return $VisitorCopyWith<$Res>(_value.visitor, (value) {
      return _then(_value.copyWith(visitor: value));
    });
  }
}

/// @nodoc
abstract class _$AppVisitorConfigCopyWith<$Res>
    implements $AppVisitorConfigCopyWith<$Res> {
  factory _$AppVisitorConfigCopyWith(
          _AppVisitorConfig value, $Res Function(_AppVisitorConfig) then) =
      __$AppVisitorConfigCopyWithImpl<$Res>;
  @override
  $Res call({List<Split> splits, Visitor visitor});

  @override
  $VisitorCopyWith<$Res> get visitor;
}

/// @nodoc
class __$AppVisitorConfigCopyWithImpl<$Res>
    extends _$AppVisitorConfigCopyWithImpl<$Res>
    implements _$AppVisitorConfigCopyWith<$Res> {
  __$AppVisitorConfigCopyWithImpl(
      _AppVisitorConfig _value, $Res Function(_AppVisitorConfig) _then)
      : super(_value, (v) => _then(v as _AppVisitorConfig));

  @override
  _AppVisitorConfig get _value => super._value as _AppVisitorConfig;

  @override
  $Res call({
    Object? splits = freezed,
    Object? visitor = freezed,
  }) {
    return _then(_AppVisitorConfig(
      splits: splits == freezed
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
      visitor: visitor == freezed
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Visitor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppVisitorConfig implements _AppVisitorConfig {
  const _$_AppVisitorConfig({required this.splits, required this.visitor});

  factory _$_AppVisitorConfig.fromJson(Map<String, dynamic> json) =>
      _$$_AppVisitorConfigFromJson(json);

  @override
  final List<Split> splits;
  @override
  final Visitor visitor;

  @override
  String toString() {
    return 'AppVisitorConfig(splits: $splits, visitor: $visitor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppVisitorConfig &&
            const DeepCollectionEquality().equals(other.splits, splits) &&
            const DeepCollectionEquality().equals(other.visitor, visitor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(splits),
      const DeepCollectionEquality().hash(visitor));

  @JsonKey(ignore: true)
  @override
  _$AppVisitorConfigCopyWith<_AppVisitorConfig> get copyWith =>
      __$AppVisitorConfigCopyWithImpl<_AppVisitorConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppVisitorConfigToJson(this);
  }
}

abstract class _AppVisitorConfig implements AppVisitorConfig {
  const factory _AppVisitorConfig(
      {required List<Split> splits,
      required Visitor visitor}) = _$_AppVisitorConfig;

  factory _AppVisitorConfig.fromJson(Map<String, dynamic> json) =
      _$_AppVisitorConfig.fromJson;

  @override
  List<Split> get splits;
  @override
  Visitor get visitor;
  @override
  @JsonKey(ignore: true)
  _$AppVisitorConfigCopyWith<_AppVisitorConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
