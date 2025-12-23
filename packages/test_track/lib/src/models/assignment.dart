import 'package:dart_mappable/dart_mappable.dart';

part 'assignment.mapper.dart';

/// {@template assignment}
/// An object representing the assigned variant
/// for a split
/// {@endtemplate}
@MappableClass()
class Assignment with AssignmentMappable {
  /// {@macro assignment}
  const Assignment({
    required this.splitName,
    required this.variant,
    this.context = '',
  });

  /// {@macro assignment}
  factory Assignment.build({
    required String splitName,
    required String variant,
    required String context,
  }) {
    return Assignment(splitName: splitName, variant: variant, context: context);
  }

  final String splitName;
  final String variant;
  final String context;
}

// ignore: public_member_api_docs
extension AssignmentExtensions on Assignment {
  /// Returns true if this [Assignment] represents a
  /// feature gate. All feature gates must end in `_enabled`.
  bool get isFeatureGate => splitName.endsWith('_enabled');
}
