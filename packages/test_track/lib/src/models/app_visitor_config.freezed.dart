// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_visitor_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppVisitorConfig _$AppVisitorConfigFromJson(Map<String, dynamic> json) {
  return _AppVisitorConfig.fromJson(json);
}

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
      _$AppVisitorConfigCopyWithImpl<$Res, AppVisitorConfig>;
  @useResult
  $Res call({List<Split> splits, Visitor visitor});

  $VisitorCopyWith<$Res> get visitor;
}

/// @nodoc
class _$AppVisitorConfigCopyWithImpl<$Res, $Val extends AppVisitorConfig>
    implements $AppVisitorConfigCopyWith<$Res> {
  _$AppVisitorConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splits = null,
    Object? visitor = null,
  }) {
    return _then(_value.copyWith(
      splits: null == splits
          ? _value.splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Visitor,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorCopyWith<$Res> get visitor {
    return $VisitorCopyWith<$Res>(_value.visitor, (value) {
      return _then(_value.copyWith(visitor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppVisitorConfigImplCopyWith<$Res>
    implements $AppVisitorConfigCopyWith<$Res> {
  factory _$$AppVisitorConfigImplCopyWith(_$AppVisitorConfigImpl value,
          $Res Function(_$AppVisitorConfigImpl) then) =
      __$$AppVisitorConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Split> splits, Visitor visitor});

  @override
  $VisitorCopyWith<$Res> get visitor;
}

/// @nodoc
class __$$AppVisitorConfigImplCopyWithImpl<$Res>
    extends _$AppVisitorConfigCopyWithImpl<$Res, _$AppVisitorConfigImpl>
    implements _$$AppVisitorConfigImplCopyWith<$Res> {
  __$$AppVisitorConfigImplCopyWithImpl(_$AppVisitorConfigImpl _value,
      $Res Function(_$AppVisitorConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splits = null,
    Object? visitor = null,
  }) {
    return _then(_$AppVisitorConfigImpl(
      splits: null == splits
          ? _value._splits
          : splits // ignore: cast_nullable_to_non_nullable
              as List<Split>,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as Visitor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppVisitorConfigImpl implements _AppVisitorConfig {
  const _$AppVisitorConfigImpl(
      {required final List<Split> splits, required this.visitor})
      : _splits = splits;

  factory _$AppVisitorConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppVisitorConfigImplFromJson(json);

  final List<Split> _splits;
  @override
  List<Split> get splits {
    if (_splits is EqualUnmodifiableListView) return _splits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_splits);
  }

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
            other is _$AppVisitorConfigImpl &&
            const DeepCollectionEquality().equals(other._splits, _splits) &&
            (identical(other.visitor, visitor) || other.visitor == visitor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_splits), visitor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVisitorConfigImplCopyWith<_$AppVisitorConfigImpl> get copyWith =>
      __$$AppVisitorConfigImplCopyWithImpl<_$AppVisitorConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppVisitorConfigImplToJson(
      this,
    );
  }
}

abstract class _AppVisitorConfig implements AppVisitorConfig {
  const factory _AppVisitorConfig(
      {required final List<Split> splits,
      required final Visitor visitor}) = _$AppVisitorConfigImpl;

  factory _AppVisitorConfig.fromJson(Map<String, dynamic> json) =
      _$AppVisitorConfigImpl.fromJson;

  @override
  List<Split> get splits;
  @override
  Visitor get visitor;
  @override
  @JsonKey(ignore: true)
  _$$AppVisitorConfigImplCopyWith<_$AppVisitorConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
