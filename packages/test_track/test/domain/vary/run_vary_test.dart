import 'package:charlatan/charlatan.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/src/helpers/typedefs.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../../networking/fakes/fake_http_client.dart';
import '../../networking/fakes/fake_http_defaults.dart';

class FakeReportAssignmentEvent extends ReportAssignmentEvent {
  final VoidCallback _onInvoked;
  FakeReportAssignmentEvent({
    required VoidCallback onInvoked,
  })  : _onInvoked = onInvoked,
        super(
          client: FakeSturdyHttp(Charlatan()),
          logger: FakeTestTrackLogger.withoutNetworkLogging(),
        );

  @override
  Future<void> call(AssignmentEvent assignmentEvent) async {
    _onInvoked.call();
  }
}

void main() {
  group('RunVary', () {
    late FakeAnalyticsProvider analyticsProvider;
    late DataStorageProvider dataStorageProvider;
    late Charlatan charlatan;

    setUp(() {
      analyticsProvider = FakeAnalyticsProvider();
      dataStorageProvider = FakeDataStorageProvider();
      charlatan = Charlatan()..withDefaults();
    });

    RunVary buildSubject({
      ReportAssignmentEvent? reportAssignmentEventOverride,
    }) {
      return RunVary(
        calculateVariant: CalculateVariant(),
        analyticsProvider: analyticsProvider,
        reportAssignmentEvent: reportAssignmentEventOverride ??
            ReportAssignmentEvent(
              client: FakeSturdyHttp(charlatan),
              logger: FakeTestTrackLogger.withoutNetworkLogging(),
            ),
        dataStorageProvider: dataStorageProvider,
      );
    }

    group('call(visitor:, split:, context:)', () {
      group('when a previous assignment exists', () {
        test('it returns the existing assigned variant if it exists', () {
          final existingAssignedVariant =
              VariantFactory.build().withName('existing');
          final split =
              SplitFactory.build().withName('fake-split').withVariants([
            existingAssignedVariant,
            VariantFactory.build(),
            VariantFactory.build(),
          ]);

          final visitor = VisitorFactory.build().withAssignments([
            Assignment(
              splitName: 'fake-split',
              variant: existingAssignedVariant.name,
            ),
          ]);

          final runVaryResult = buildSubject().call(
            visitor: visitor,
            split: split,
            defaultVariant: 'control',
            context: 'none',
          );

          expect(runVaryResult.variant, existingAssignedVariant.name);
          // Ensure the updated visitor assignments doesn't contain a duplicated
          // existing assignment
          expect(
            runVaryResult.visitor.assignments
                .where((element) => element.variant == 'existing')
                .length,
            1,
          );
        });

        test(
            'it returns the default variant if the existing assignment variant no longer exists',
            () {
          final split =
              SplitFactory.build().withName('fake-split').withVariants([
            VariantFactory.build().withName('iExist'),
            VariantFactory.build().withName('iAlsoExist'),
            VariantFactory.build().withName('iExistAsWell')
          ]);
          final visitor = VisitorFactory.build().withAssignments([
            AssignmentFactory.build()
                .withSplitName('fake-split')
                .withVariant('iNoLongerExist'),
          ]);

          final runVaryResult = buildSubject().call(
            visitor: visitor,
            split: split,
            defaultVariant: 'expectedDefault',
            context: 'none',
          );

          expect(runVaryResult.variant, 'expectedDefault');
          // Ensure the updated visitor assignments were correctly updated
          // with the default variant
          expect(
            runVaryResult.visitor.assignments
                .where((a) => a.variant == 'expectedDefault'),
            isNotEmpty,
          );
          expect(
            runVaryResult.visitor.assignments
                .where((a) => a.variant == 'iNoLongerExist'),
            isEmpty,
          );
        });
      });

      group('when a previous assignment does not exist', () {
        test('it calculates a new variant', () {
          final expectedAssignedVariant =
              VariantFactory.build().withName('pickMe').withWeight(100);
          final split = SplitFactory.build().withVariants([
            expectedAssignedVariant,
            VariantFactory.build().withName('doNotPickMe').withWeight(0),
            VariantFactory.build().withName('doNotPickMeEither').withWeight(0),
          ]);
          final visitor = VisitorFactory.build().withAssignments([]);

          final runVaryResult = buildSubject().call(
            visitor: visitor,
            split: split,
            defaultVariant: 'control',
            context: 'none',
          );

          expect(runVaryResult.variant, expectedAssignedVariant.name);
          // Ensure the updated visitor assignments contain the new assignment
          expect(
            runVaryResult.visitor.assignments
                .where(
                  (element) => element.variant == expectedAssignedVariant.name,
                )
                .length,
            1,
          );
        });

        test('it tracks assignments for non-feature-gate assignments', () {
          final visitor = VisitorFactory.build().withAssignments([]);
          final split = SplitFactory.build(isFeatureGate: false).withVariants([
            const Variant(name: 'true', weight: 100),
            const Variant(name: 'false', weight: 0),
          ]);

          buildSubject().call(
            visitor: visitor,
            split: split,
            defaultVariant: 'true',
            context: 'none',
          );

          expect(
            analyticsProvider.tracked(
              assignment: Pair(
                visitor.id,
                Assignment(
                  splitName: split.name,
                  variant: 'true',
                  context: 'none',
                ),
              ),
            ),
            isTrue,
          );
        });

        test('it reports assignment events for non-feature-gate assignments',
            () async {
          final visitor = VisitorFactory.build().withAssignments([]);
          final split = SplitFactory.build(isFeatureGate: false).withVariants([
            const Variant(name: 'true', weight: 100),
            const Variant(name: 'false', weight: 0),
          ]);

          var reportAssignmentEventCalled = false;
          // Use a fake `ReportAssignmentEvent` because in source code its
          // invocation is not awaited and the test will fail
          final reportAssignmentEvent =
              FakeReportAssignmentEvent(onInvoked: () {
            reportAssignmentEventCalled = true;
          });
          buildSubject(
            reportAssignmentEventOverride: reportAssignmentEvent,
          ).call(
            visitor: visitor,
            split: split,
            defaultVariant: 'true',
            context: 'none',
          );

          await expectLater(
            reportAssignmentEventCalled,
            isTrue,
          );
        });

        test('it does not track assignments for feature gate assignments ', () {
          final visitor = VisitorFactory.build().withAssignments([]);
          final split = SplitFactory.build(isFeatureGate: true);

          buildSubject().call(
            visitor: visitor,
            split: split,
            defaultVariant: 'true',
            context: 'none',
          );

          expect(
            analyticsProvider.assignmentsTracked,
            isEmpty,
          );
        });

        test(
            'it does not report assignment events for feature gate assignments ',
            () async {
          final visitor = VisitorFactory.build().withAssignments([]);
          final split = SplitFactory.build(isFeatureGate: true);

          var reportAssignmentEventCalled = false;
          // Use a fake `ReportAssignmentEvent` because in source code its
          // invocation is not awaited and the test will fail
          final reportAssignmentEvent =
              FakeReportAssignmentEvent(onInvoked: () {
            reportAssignmentEventCalled = true;
          });
          buildSubject(
            reportAssignmentEventOverride: reportAssignmentEvent,
          ).call(
            visitor: visitor,
            split: split,
            defaultVariant: 'true',
            context: 'none',
          );

          await expectLater(
            reportAssignmentEventCalled,
            isFalse,
          );
        });

        test(
            'it returns the updated visitor with new assignment added to existing ones',
            () {
          final expectedAssignedVariant =
              VariantFactory.build().withName('pickMe').withWeight(100);
          final split = SplitFactory.build().withVariants([
            expectedAssignedVariant,
            VariantFactory.build().withName('doNotPickMe').withWeight(0),
            VariantFactory.build().withName('doNotPickMeEither').withWeight(0),
          ]);
          final visitor = VisitorFactory.build().withAssignments([
            const Assignment(
              splitName: 'existing_split',
              variant: 'existing_variant',
            )
          ]);

          final runVaryResult = buildSubject().call(
            visitor: visitor,
            split: split,
            defaultVariant: 'control',
            context: 'none',
          );

          expect(
            runVaryResult.visitor.assignments,
            [
              // Existing assignments
              ...visitor.assignments,
              // New assignment
              Assignment(
                splitName: split.name,
                variant: expectedAssignedVariant.name,
                context: 'none',
              )
            ],
          );
        });

        test('it stores the updated visitor in data storage', () async {
          final expectedAssignedVariant =
              VariantFactory.build().withName('pickMe').withWeight(100);
          final split = SplitFactory.build().withVariants([
            expectedAssignedVariant,
            VariantFactory.build().withName('doNotPickMe').withWeight(0),
            VariantFactory.build().withName('doNotPickMeEither').withWeight(0),
          ]);
          final visitor = VisitorFactory.build().withAssignments([]);

          buildSubject().call(
            visitor: visitor,
            split: split,
            defaultVariant: 'control',
            context: 'none',
          );

          final updatedVisitor = await dataStorageProvider.fetchVisitor();

          expect(
            updatedVisitor!.assignments.single,
            Assignment(
              splitName: split.name,
              variant: expectedAssignedVariant.name,
              context: 'none',
            ),
          );
        });
      });
    });
  });
}
