import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

class SplitRegistryFactory {
  static SplitRegistry build() {
    return SplitRegistry(splits: List.generate(6, (_) => SplitFactory.build()));
  }
}

extension SplitRegistryExtensions on SplitRegistry {
  SplitRegistry withSplits(List<Split> splits) {
    return copyWith(splits: splits);
  }
}
