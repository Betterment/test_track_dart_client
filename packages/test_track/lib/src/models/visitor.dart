import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/src/models/assignment.dart';
import 'package:uuid/uuid.dart';

part 'visitor.freezed.dart';
part 'visitor.g.dart';

@freezed
class Visitor with _$Visitor {
  const factory Visitor({
    required List<Assignment> assignments,
    required String id,
  }) = _Visitor;

  factory Visitor.build() => Visitor(id: const Uuid().v4(), assignments: []);

  factory Visitor.fromJson(Map<String, dynamic> json) =>
      _$VisitorFromJson(json);
}
