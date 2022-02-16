import 'package:test/test.dart';
import 'package:test_track/src/models/models.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('AppVisitorConfigExtension', () {
    group('splitRegistry', () {
      test('it returns a SplitRegistry that contains a list of the splits', () {
        final splits = const [
          Split(isFeatureGate: true, name: 'split', variants: []),
        ];
        final subject = AppVisitorConfig(
          splits: splits,
          visitor: VisitorFactory.build(),
        );
        expect(subject.splitRegistry.splits, splits);
      });
    });
  });
}
