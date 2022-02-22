import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/src/models/assignment.dart';
import 'package:uuid/uuid.dart';

part 'visitor.freezed.dart';
part 'visitor.g.dart';

/// {@template visitor}
/// A user registered with the TestTrack system
/// {@endtemplate}
@freezed
class Visitor with _$Visitor {
  /// {@macro visitor}
  const factory Visitor({
    required List<Assignment> assignments,
    required String id,
  }) = _Visitor;

  /// {@macro visitor}
  factory Visitor.build() => Visitor(id: const Uuid().v4(), assignments: []);

  // ignore: public_member_api_docs
  factory Visitor.fromJson(Map<String, dynamic> json) =>
      _$VisitorFromJson(json);
}
