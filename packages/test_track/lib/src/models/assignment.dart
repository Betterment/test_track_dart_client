import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment.freezed.dart';
part 'assignment.g.dart';

@freezed
class Assignment with _$Assignment {
  const factory Assignment({
    required String splitName,
    required String variant,
    @Default('') String context,
  }) = _Assignment;

  factory Assignment.build({
    required String splitName,
    required String variant,
    required String context,
  }) {
    return Assignment(
      splitName: splitName,
      variant: variant,
      context: context,
    );
  }

  factory Assignment.fromJson(Map<String, dynamic> json) => _$AssignmentFromJson(json);
}

extension AssignmentExtensions on Assignment {
  bool get isFeatureGate => splitName.endsWith('_enabled');
}
