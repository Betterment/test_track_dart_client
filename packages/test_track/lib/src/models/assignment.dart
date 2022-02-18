import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment.freezed.dart';
part 'assignment.g.dart';

/// {@template assignment}
/// An object representing the assigned variant
/// for a split
/// {@endtemplate}
@freezed
class Assignment with _$Assignment {
  /// {@macro assignment}
  const factory Assignment({
    required String splitName,
    required String variant,
    @Default('') String context,
  }) = _Assignment;

  /// {@macro assignment}
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

  // ignore: public_member_api_docs
  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);
}

// ignore: public_member_api_docs
extension AssignmentExtensions on Assignment {
  /// Returns true if this [Assignment] represents a
  /// feature gate. All feature gates must end in `_enabled`.
  bool get isFeatureGate => splitName.endsWith('_enabled');
}
