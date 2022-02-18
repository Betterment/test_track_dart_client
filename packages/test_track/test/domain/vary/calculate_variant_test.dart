import 'package:test/test.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/src/errors/errors.dart';
import 'package:test_track/src/models/models.dart';

void main() {
  group('CalculateVariant', () {
    group('call(visitorId:, split:)', () {
      test('returns correct variant when variants are present', () {
        final variants = const [
          Variant(name: 'huge', weight: 1),
          Variant(name: 'miniscule', weight: 19),
          Variant(name: 'extra_giant', weight: 0),
          Variant(name: 'giant', weight: 80),
          Variant(name: 'little', weight: 0),
          Variant(name: 'tiny', weight: 0),
        ];

        final visitorId = '00000000-0000-0000-0000-000000000000';
        final split = Split(
          name: 'logoSize',
          variants: variants,
          isFeatureGate: false,
        );

        final subject = CalculateVariant();

        expect(
            subject.call(visitorId: visitorId, split: split).name, 'miniscule');
      });

      test('throws exception when no variants are present', () {
        final visitorId = '00000000-0000-0000-0000-000000000000';
        final split = const Split(
          name: 'logoSize',
          variants: [],
          isFeatureGate: false,
        );

        final subject = CalculateVariant();

        expect(
          () => subject.call(visitorId: visitorId, split: split),
          throwsA(isA<AssignmentBucketOutOfRangeException>()),
        );
      });
    });
  });
}
