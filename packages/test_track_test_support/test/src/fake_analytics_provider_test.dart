import 'package:test/test.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../helpers/matchers.dart';

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
          onlyContains([
            Pair('123', assignment1),
            Pair('456', assignment2),
          ]),
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

      test('it returns false if the assignment was not tracked', () {
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

    group('visitorsIdentified', () {
      test('it collects identified visitors', () {
        subject.identify(visitorId: '123');
        subject.identify(visitorId: '456');

        expect(
          subject.visitorsIdentified,
          onlyContains(['123', '456']),
        );
      });
    });

    group('identified', () {
      test('it returns true if the visitor was identified', () {
        subject.identify(visitorId: '123');

        expect(
          subject.identified(visitorId: '123'),
          isTrue,
        );
      });

      test('it returns false if the visitor was not identified', () {
        subject.identify(visitorId: '123');

        expect(
          subject.identified(visitorId: '456'),
          isFalse,
        );
      });
    });

    group('noVisitorsIdentified', () {
      test('it returns true if no visitories were identified', () {
        expect(
          subject.noVisitorsIdentified(),
          isTrue,
        );
      });

      test('it returns false if any visitories were identified', () {
        subject.identify(visitorId: '123');

        expect(
          subject.noVisitorsIdentified(),
          isFalse,
        );
      });
    });
  });
}
