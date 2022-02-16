import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment_event.freezed.dart';
part 'assignment_event.g.dart';

@freezed
class AssignmentEvent with _$AssignmentEvent {
  const factory AssignmentEvent({
    required String visitorId,
    required String splitName,
    required String context,
  }) = _AssignmentEvent;

  factory AssignmentEvent.fromJson(Map<String, dynamic> json) => _$AssignmentEventFromJson(json);
}
