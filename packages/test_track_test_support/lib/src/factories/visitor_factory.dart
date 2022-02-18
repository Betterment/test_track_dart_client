import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

/// {@template visitor_factory}
/// Produces [Visitor]s to be used for
/// testing
/// {@endtemplate}
class VisitorFactory {
  /// {@macro visitor_factory}
  static Visitor build() {
    return Visitor(
      assignments: List.generate(5, (index) => AssignmentFactory.build()),
      id: randomAlphaNumeric(10),
    );
  }
}

/// Supported modifications for [Visitor]s
extension VisitorExtensions on Visitor {
  /// Returns a copy of this [Visitor] with the new [Assignment]s
  Visitor withAssignments(List<Assignment> assignments) {
    return copyWith(assignments: assignments);
  }

  /// Returns a copy of this [Visitor] with the new id
  Visitor withId(String id) {
    return copyWith(id: id);
  }
}
