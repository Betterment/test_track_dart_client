// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Visitor _$VisitorFromJson(Map<String, dynamic> json) {
  return _Visitor.fromJson(json);
}

/// @nodoc
mixin _$Visitor {
  List<Assignment> get assignments => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this Visitor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Visitor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitorCopyWith<Visitor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorCopyWith<$Res> {
  factory $VisitorCopyWith(Visitor value, $Res Function(Visitor) then) =
      _$VisitorCopyWithImpl<$Res, Visitor>;
  @useResult
  $Res call({List<Assignment> assignments, String id});
}

/// @nodoc
class _$VisitorCopyWithImpl<$Res, $Val extends Visitor>
    implements $VisitorCopyWith<$Res> {
  _$VisitorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Visitor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignments = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      assignments: null == assignments
          ? _value.assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as List<Assignment>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitorImplCopyWith<$Res> implements $VisitorCopyWith<$Res> {
  factory _$$VisitorImplCopyWith(
          _$VisitorImpl value, $Res Function(_$VisitorImpl) then) =
      __$$VisitorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Assignment> assignments, String id});
}

/// @nodoc
class __$$VisitorImplCopyWithImpl<$Res>
    extends _$VisitorCopyWithImpl<$Res, _$VisitorImpl>
    implements _$$VisitorImplCopyWith<$Res> {
  __$$VisitorImplCopyWithImpl(
      _$VisitorImpl _value, $Res Function(_$VisitorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Visitor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignments = null,
    Object? id = null,
  }) {
    return _then(_$VisitorImpl(
      assignments: null == assignments
          ? _value._assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as List<Assignment>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitorImpl implements _Visitor {
  const _$VisitorImpl(
      {required final List<Assignment> assignments, required this.id})
      : _assignments = assignments;

  factory _$VisitorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorImplFromJson(json);

  final List<Assignment> _assignments;
  @override
  List<Assignment> get assignments {
    if (_assignments is EqualUnmodifiableListView) return _assignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignments);
  }

  @override
  final String id;

  @override
  String toString() {
    return 'Visitor(assignments: $assignments, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorImpl &&
            const DeepCollectionEquality()
                .equals(other._assignments, _assignments) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_assignments), id);

  /// Create a copy of Visitor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorImplCopyWith<_$VisitorImpl> get copyWith =>
      __$$VisitorImplCopyWithImpl<_$VisitorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorImplToJson(
      this,
    );
  }
}

abstract class _Visitor implements Visitor {
  const factory _Visitor(
      {required final List<Assignment> assignments,
      required final String id}) = _$VisitorImpl;

  factory _Visitor.fromJson(Map<String, dynamic> json) = _$VisitorImpl.fromJson;

  @override
  List<Assignment> get assignments;
  @override
  String get id;

  /// Create a copy of Visitor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitorImplCopyWith<_$VisitorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
