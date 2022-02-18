import 'package:test/test.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('FakeAnalyticsProvider', () {
    late FakeAnalyticsProvider subject;

    setUp(() {
      subject = FakeAnalyticsProvider();
    });
    group('assignmentsTracked', () {
      test('it collects tracked assignments', () {
        final assignment1 = AssignmentFactory.build();
        final assignment2 = AssignmentFactory.build();
        subject.trackAssignment(
          visitorId: '123',
          assignment: assignment1,
        );
        subject.trackAssignment(
          visitorId: '456',
          assignment: assignment2,
        );
        expect(
          subject.assignmentsTracked,
          [
            Pair('123', assignment1),
            Pair('456', assignment2),
          ],
        );
      });
    });

    group('tracked', () {
      test('it returns true if the assignment was tracked', () {
        final assignment1 = AssignmentFactory.build();
        subject.trackAssignment(
          visitorId: '123',
          assignment: assignment1,
        );
        expect(
          subject.tracked(assignment: Pair('123', assignment1)),
          isTrue,
        );
      });

      test('it false true if the assignment was not tracked', () {
        final assignment1 = AssignmentFactory.build();
        expect(
          subject.tracked(assignment: Pair('123', assignment1)),
          isFalse,
        );
      });
    });

    group('noAssignmentsTracked', () {
      test('it returns true if no assignments were tracked', () {
        expect(
          subject.noAssignmentsTracked(),
          isTrue,
        );
      });

      test('it returns false if assignments were tracked', () {
        final assignment1 = AssignmentFactory.build();
        subject.trackAssignment(
          visitorId: '123',
          assignment: assignment1,
        );
        expect(
          subject.noAssignmentsTracked(),
          isFalse,
        );
      });
    });
  });
}
