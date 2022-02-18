import 'package:test/test.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('SplitRegistry', () {
    group('findSplitByName', () {
      group('when given a split name that does not exist in the split registy',
          () {
        test('it throws a SplitNotFoundException', () {
          final split = SplitFactory.build().withName('name');
          final subject = SplitRegistryFactory.build().withSplits([split]);

          expect(
            () => subject.findSplitByName('wrong-name'),
            throwsA(isA<SplitNotFoundException>()),
          );
        });
      });

      group('when given a split name that does exist in the split registy', () {
        test('it returns the split with the given name', () {
          final split = SplitFactory.build().withName('name');
          final subject = SplitRegistryFactory.build().withSplits([split]);

          expect(
            subject.findSplitByName('name'),
            split,
          );
        });
      });
    });
  });
}
