// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visitor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Visitor _$VisitorFromJson(Map<String, dynamic> json) {
  return _Visitor.fromJson(json);
}

/// @nodoc
class _$VisitorTearOff {
  const _$VisitorTearOff();

  _Visitor call({required List<Assignment> assignments, required String id}) {
    return _Visitor(
      assignments: assignments,
      id: id,
    );
  }

  Visitor fromJson(Map<String, Object?> json) {
    return Visitor.fromJson(json);
  }
}

/// @nodoc
const $Visitor = _$VisitorTearOff();

/// @nodoc
mixin _$Visitor {
  List<Assignment> get assignments => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorCopyWith<Visitor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorCopyWith<$Res> {
  factory $VisitorCopyWith(Visitor value, $Res Function(Visitor) then) =
      _$VisitorCopyWithImpl<$Res>;
  $Res call({List<Assignment> assignments, String id});
}

/// @nodoc
class _$VisitorCopyWithImpl<$Res> implements $VisitorCopyWith<$Res> {
  _$VisitorCopyWithImpl(this._value, this._then);

  final Visitor _value;
  // ignore: unused_field
  final $Res Function(Visitor) _then;

  @override
  $Res call({
    Object? assignments = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      assignments: assignments == freezed
          ? _value.assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as List<Assignment>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VisitorCopyWith<$Res> implements $VisitorCopyWith<$Res> {
  factory _$VisitorCopyWith(_Visitor value, $Res Function(_Visitor) then) =
      __$VisitorCopyWithImpl<$Res>;
  @override
  $Res call({List<Assignment> assignments, String id});
}

/// @nodoc
class __$VisitorCopyWithImpl<$Res> extends _$VisitorCopyWithImpl<$Res>
    implements _$VisitorCopyWith<$Res> {
  __$VisitorCopyWithImpl(_Visitor _value, $Res Function(_Visitor) _then)
      : super(_value, (v) => _then(v as _Visitor));

  @override
  _Visitor get _value => super._value as _Visitor;

  @override
  $Res call({
    Object? assignments = freezed,
    Object? id = freezed,
  }) {
    return _then(_Visitor(
      assignments: assignments == freezed
          ? _value.assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as List<Assignment>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Visitor implements _Visitor {
  const _$_Visitor({required this.assignments, required this.id});

  factory _$_Visitor.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorFromJson(json);

  @override
  final List<Assignment> assignments;
  @override
  final String id;

  @override
  String toString() {
    return 'Visitor(assignments: $assignments, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Visitor &&
            const DeepCollectionEquality()
                .equals(other.assignments, assignments) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(assignments),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$VisitorCopyWith<_Visitor> get copyWith =>
      __$VisitorCopyWithImpl<_Visitor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorToJson(this);
  }
}

abstract class _Visitor implements Visitor {
  const factory _Visitor(
      {required List<Assignment> assignments, required String id}) = _$_Visitor;

  factory _Visitor.fromJson(Map<String, dynamic> json) = _$_Visitor.fromJson;

  @override
  List<Assignment> get assignments;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$VisitorCopyWith<_Visitor> get copyWith =>
      throw _privateConstructorUsedError;
}
