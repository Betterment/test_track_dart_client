import 'package:charlatan/charlatan.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../../networking/fakes/fake_http_client.dart';
import '../../networking/fakes/fake_http_defaults.dart';

void main() {
  group('RunAb', () {
    late RunAb subject;

    setUp(() {
      final charlatan = Charlatan()..withDefaults();
      subject = RunAb(
        runVary: RunVary(
          calculateVariant: CalculateVariant(),
          analyticsProvider: FakeAnalyticsProvider(),
          reportAssignmentEvent: ReportAssignmentEvent(
            client: FakeHttpClient(charlatan),
            logger: FakeTestTrackLogger.withoutNetworkLogging(),
          ),
          dataStorageProvider: FakeDataStorageProvider(),
        ),
      );
    });

    group('call(visitor:, split: context:)', () {
      group('a split with 2 variants', () {
        test('it completes normally', () {
          final split = SplitFactory.build(isFeatureGate: true);
          final visitor = VisitorFactory.build();

          expect(
            subject.call(
              visitor: visitor,
              split: split,
              context: 'none',
            ),
            isA<RunAbResult>(),
          );
        });

        test('it returns true if calculated variant is the true variant', () {
          final trueVariant = const Variant(name: 'thisOneIsTrue', weight: 100);
          final split = SplitFactory.build().withVariants([
            trueVariant,
            const Variant(name: 'thisOneIsFalse', weight: 0),
          ]);
          final visitor = VisitorFactory.build();

          final result = subject.call(
            visitor: visitor,
            split: split,
            context: 'none',
            trueVariant: 'thisOneIsTrue',
          );
          expect(
            result.isTrueVariant,
            isTrue,
          );
        });

        test('it returns false if calculated variant is not the true variant',
            () {
          final trueVariant = const Variant(name: 'thisOneIsTrue', weight: 0);
          final split = SplitFactory.build().withVariants([
            trueVariant,
            const Variant(name: 'thisOneIsFalse', weight: 100),
          ]);
          final visitor = VisitorFactory.build();

          final result = subject.call(
            visitor: visitor,
            split: split,
            context: 'none',
            trueVariant: 'thisOneIsTrue',
          );
          expect(
            result.isTrueVariant,
            false,
          );
        });

        test('it returns the updated visitor produced by RunVary', () {
          final trueVariant = const Variant(name: 'thisOneIsTrue', weight: 100);
          final split = SplitFactory.build().withVariants([
            trueVariant,
            const Variant(name: 'thisOneIsFalse', weight: 0),
          ]);
          final visitor = VisitorFactory.build().withAssignments([]);

          final result = subject.call(
            visitor: visitor,
            split: split,
            context: 'none',
            trueVariant: 'thisOneIsTrue',
          );
          expect(
            result.visitor.assignments.single,
            Assignment(
              splitName: split.name,
              variant: trueVariant.name,
              context: 'none',
            ),
          );
        });
      });

      group('a split with 1 variant', () {
        late Split split;
        late Visitor visitor;

        setUp(() {
          split = SplitFactory.build().withVariants([
            const Variant(name: 'thisOneIsTrue', weight: 100),
          ]);
          visitor = VisitorFactory.build();
        });

        test('it completes normally', () {
          expect(
            subject.call(
              visitor: visitor,
              split: split,
              context: 'none',
            ),
            isA<RunAbResult>(),
          );
        });

        test('it returns true if the single variant is the true variant', () {
          final result = subject.call(
            visitor: visitor,
            split: split,
            context: 'none',
            trueVariant: 'thisOneIsTrue',
          );
          expect(
            result.isTrueVariant,
            true,
          );
        });

        test('it returns false if the single variant is not the true variant',
            () {
          final result = subject.call(
            visitor: visitor,
            split: split,
            context: 'none',
            trueVariant: 'randomTrueVariant',
          );
          expect(
            result.isTrueVariant,
            false,
          );
        });

        test('it defaults the trueVariant to "true" if none is supplied', () {
          final split = SplitFactory.build().withVariants(
            const [
              Variant(name: 'true', weight: 100),
            ],
          );
          final visitor = VisitorFactory.build();

          final result = subject.call(
            visitor: visitor,
            split: split,
            context: 'none',
            /* trueVariant not supplied */
          );
          expect(
            result.isTrueVariant,
            true,
          );
        });
      });

      group('a split with more than 2 variants', () {
        test('it throws a InvalidSplitConfigurationForAbTestingException', () {
          final split = SplitFactory.build().withVariants([
            VariantFactory.build(),
            VariantFactory.build(),
            VariantFactory.build(),
          ]);
          final visitor = VisitorFactory.build();

          expect(
            () => subject.call(
              visitor: visitor,
              split: split,
              context: 'none',
            ),
            throwsA(isA<InvalidSplitConfigurationForAbTestingException>()),
          );
        });
      });
    });
  });
}
