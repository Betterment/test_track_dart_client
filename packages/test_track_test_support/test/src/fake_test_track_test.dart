import 'package:test/test.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('FakeTestTrack', () {
    group('visitor', () {
      test('it returns provided visitor', () {
        final visitor = Visitor.build();
        final testTrack = FakeTestTrack(visitor: visitor);
        expect(visitor, testTrack.visitor);
      });
    });

    group('splitRegistry', () {
      test('it returns provided split registry', () {
        final splitRegistry = SplitRegistry(
          splits: [
            const Split(
              name: 'name',
              variants: [
                Variant(name: 'name', weight: 100),
              ],
              isFeatureGate: true,
            ),
          ],
        );
        final testTrack = FakeTestTrack(
          splitRegistry: splitRegistry,
        );
        expect(splitRegistry, testTrack.splitRegistry);
      });
    });

    group('visitorAssignments', () {
      test('it returns provided visitors assignments', () {
        final visitor = Visitor.build().copyWith(assignments: [
          const Assignment(
            splitName: 'foo_enabled',
            variant: 'true',
          )
        ]);
        final testTrack = FakeTestTrack(visitor: visitor);
        expect(
          visitor.assignments,
          testTrack.visitorAssignments,
        );
      });
    });

    group('ab', () {
      test('it returns true by default', () {
        final testTrack = FakeTestTrack();
        expect(
          testTrack.ab(
            splitName: 'splitName',
            context: 'context',
          ),
          isTrue,
        );
      });

      test('it returns delegated logic if provided', () {
        final testTrack = FakeTestTrack(
          ab: (_, __, ___) => false,
        );
        expect(
          testTrack.ab(
            splitName: 'splitName',
            context: 'context',
          ),
          isFalse,
        );
      });
    });

    group('vary', () {
      test('it returns defaultVariant by default', () {
        final testTrack = FakeTestTrack();
        expect(
          testTrack.vary(
            splitName: 'splitName',
            context: 'context',
            defaultVariant: 'dude',
          ),
          'dude',
        );
      });

      test('it returns delegated logic if provided', () {
        final testTrack = FakeTestTrack(
          vary: (_, __, ___) => 'dude',
        );
        expect(
          testTrack.vary(
            splitName: 'splitName',
            context: 'context',
            defaultVariant: 'notDude',
          ),
          'dude',
        );
      });
    });

    group('login', () {
      test('it changes auth state to logged in', () async {
        final testTrack = FakeTestTrack();

        expect(testTrack.isLoggedIn, isFalse);

        await testTrack.login(
          identifierType: 'identifierType',
          value: 'value',
        );

        expect(testTrack.isLoggedIn, isTrue);
      });
    });

    group('logout', () {
      test('it changes auth state to logged out', () async {
        final testTrack = FakeTestTrack();
        await testTrack.login(identifierType: 'identifierType', value: 'value');

        expect(testTrack.isLoggedIn, isTrue);

        await testTrack.logout();

        expect(testTrack.isLoggedIn, isFalse);
      });
    });

    group('reset', () {
      test('it changes auth state to logged out and builds a new visitor',
          () async {
        final testTrack = FakeTestTrack();
        final visitor = testTrack.visitor;
        await testTrack.login(identifierType: 'identifierType', value: 'value');

        expect(testTrack.isLoggedIn, isTrue);

        await testTrack.reset();

        expect(testTrack.isLoggedIn, isFalse);
        expect(testTrack.visitor == visitor, isFalse);
      });
    });

    group('overrideVisitorId', () {
      test('it updates visitor id', () async {
        final testTrack = FakeTestTrack();
        final visitorBefore = testTrack.visitor;
        await testTrack.overrideVisitorId('overridden');
        final visitorAfter = testTrack.visitor;

        expect(visitorBefore != visitorAfter, isTrue);
        expect(visitorAfter.id, 'overridden');
      });
    });

    group('createAssignmentOverrides', () {
      test('it modifies the current visitors assignments', () async {
        final testTrack = FakeTestTrack();
        final visitor = testTrack.visitor;

        expect(visitor.assignments, isEmpty);

        final override = const AssignmentOverride(
          splitName: 'splitName',
          variant: 'variant',
        );
        await testTrack.createAssignmentOverrides(
          assignmentOverrides: [override],
        );

        expect(
          testTrack.visitorAssignments.single,
          Assignment(
            splitName: override.splitName,
            variant: override.variant,
            context: override.context,
          ),
        );
      });
    });
  });
}
