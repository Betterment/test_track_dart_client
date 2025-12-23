import 'package:dart_mappable/dart_mappable.dart';

part 'assignment_event.mapper.dart';

/// {@template assignment_event}
/// A payload representing an assignment that was recently
/// made by running a `vary` operation.
/// {@endtemplate}
@MappableClass()
class AssignmentEvent with AssignmentEventMappable {
  /// {@macro assignment_event}
  ///
  /// The payload includes the [visitorId] and [splitName]
  /// of the assignment, as well as the [context] in which
  /// the assignment was made
  const AssignmentEvent({
    required this.visitorId,
    required this.splitName,
    required this.context,
  });

  final String visitorId;
  final String splitName;
  final String context;
}
