import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment_event.freezed.dart';
part 'assignment_event.g.dart';

/// {@template assignment_event}
/// A payload representing an assignment that was recently
/// made by running a `vary` operation.
/// {@endtemplate}
@freezed
class AssignmentEvent with _$AssignmentEvent {
  /// {@macro assignment_event}
  ///
  /// The payload includes the [visitorId] and [splitName]
  /// of the assignment, as well as the [context] in which
  /// the assignment was made
  const factory AssignmentEvent({
    required String visitorId,
    required String splitName,
    required String context,
  }) = _AssignmentEvent;

  // ignore: public_member_api_docs
  factory AssignmentEvent.fromJson(Map<String, dynamic> json) =>
      _$AssignmentEventFromJson(json);
}
