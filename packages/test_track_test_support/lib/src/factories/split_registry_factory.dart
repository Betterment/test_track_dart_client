import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

/// {@template split_registry_factory}
/// Produces [SplitRegistry]s to be used for
/// testing
/// {@endtemplate}
class SplitRegistryFactory {
  /// {@macro split_registry_factory}
  static SplitRegistry build() {
    return SplitRegistry(splits: List.generate(6, (_) => SplitFactory.build()));
  }
}

/// Supported modifications for [SplitRegistry]s
extension SplitRegistryExtensions on SplitRegistry {
  /// Returns a copy of this [SplitRegistry] with the new [Split]s
  SplitRegistry withSplits(List<Split> splits) {
    return copyWith(splits: splits);
  }
}
