import 'package:equatable/equatable.dart';

class AssignmentOverride extends Equatable {
  static const assignmentContext = 'mobile_split_editor';

  final String splitName;
  final String variant;

  const AssignmentOverride({
    required this.splitName,
    required this.variant,
  });

  String get context => assignmentContext;

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
