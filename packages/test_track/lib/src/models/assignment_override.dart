import 'package:equatable/equatable.dart';

/// {@template assignment_override}
/// An object allowing you to override an assignment
/// with a given variant
/// {@endtemplate}
class AssignmentOverride extends Equatable {
  /// The context for all [AssignmentOverride]s.
  ///
  /// Since this object will be used in a development environment,
  /// this context will be assigned to all overrides.
  static const assignmentContext = 'mobile_split_editor';

  /// The name of the split to be overridden
  final String splitName;

  /// The name of the variant that should be assigned
  /// for the split
  final String variant;

  /// {@macro assignment_override}
  const AssignmentOverride({required this.splitName, required this.variant});

  /// The context of the override
  String get context => assignmentContext;

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return <String, Object>{
      'split_name': splitName,
      'variant': variant,
      'context': context,
    };
  }

  @override
  List<Object?> get props => [splitName, variant];
}
