import 'package:dart_mappable/dart_mappable.dart';
import 'package:test_track/src/models/assignment.dart';
import 'package:uuid/uuid.dart';

part 'visitor.mapper.dart';

/// {@template visitor}
/// A user registered with the TestTrack system
/// {@endtemplate}
@MappableClass()
class Visitor with VisitorMappable {
  /// {@macro visitor}
  const Visitor({required this.assignments, required this.id});

  final List<Assignment> assignments;
  final String id;

  /// {@macro visitor}
  factory Visitor.build() => Visitor(id: const Uuid().v4(), assignments: []);
}
