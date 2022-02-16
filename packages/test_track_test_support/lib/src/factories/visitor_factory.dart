import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

class VisitorFactory {
  static Visitor build() {
    return Visitor(
      assignments: List.generate(5, (index) => AssignmentFactory.build()),
      id: randomAlphaNumeric(10),
    );
  }
}

extension VisitorExtensions on Visitor {
  Visitor withAssignments(List<Assignment> assignments) {
    return copyWith(assignments: assignments);
  }

  Visitor withId(String id) {
    return copyWith(id: id);
  }
}
