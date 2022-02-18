import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';

/// {@template assignment_factory}
/// Produces [Assignment]s to be used for
/// testing
/// {@endtemplate}
class AssignmentFactory {
  /// {@macro assignment_factory}
  static Assignment build() {
    return Assignment(
      splitName: 'split-${randomAlphaNumeric(10)}',
      variant: 'variant-${randomAlphaNumeric(10)}',
      context: 'context-${randomAlphaNumeric(10)}',
    );
  }
}

/// Supported modifications for [Assignment]s
extension AssignmentExtensions on Assignment {
  /// Returns a copy of this [Assignment] with the new [Split] name
  Assignment withSplitName(String splitName) {
    return copyWith(splitName: splitName);
  }

  /// Returns a copy of this [Assignment] with the [Variant] name
  Assignment withVariant(String variant) {
    return copyWith(variant: variant);
  }

  /// Returns a copy of this [Assignment] with the new context
  Assignment withContext(String context) {
    return copyWith(context: context);
  }
}
