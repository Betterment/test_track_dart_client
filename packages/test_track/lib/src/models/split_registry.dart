import 'package:dart_mappable/dart_mappable.dart';
import 'package:test_track/src/errors/errors.dart';
import 'package:test_track/src/models/split.dart';

part 'split_registry.mapper.dart';

/// {@template split_registry}
/// The registry of [Split]s, usually associated
/// with the current TestTrack visitor
/// {@endtemplate}
@MappableClass()
class SplitRegistry with SplitRegistryMappable {
  /// {@macro split_registry}
  const SplitRegistry({required this.splits});

  /// The list of [Split]s in this registry
  final List<Split> splits;

  /// Produces a [SplitRegistry] with no [Split]s
  factory SplitRegistry.empty() => SplitRegistry(splits: []);
}

// ignore: public_member_api_docs
extension SplitRegistryExtension on SplitRegistry {
  /// Attempts to find a [Split] within this [SplitRegistry]
  ///
  /// If the [Split] cannot be found, throws a [SplitNotFoundException]
  Split findSplitByName(String name) {
    return splits.firstWhere(
      (s) => s.name == name,
      orElse: () {
        throw SplitNotFoundException(name);
      },
    );
  }
}

/// {@template split_not_found_exception}
/// [TestTrackException] thrown when a [Split] cannot
/// be found in a [SplitRegistry]
/// {@endtemplate}
class SplitNotFoundException implements TestTrackException {
  final String _splitName;

  /// {@macro split_not_found_exception}
  SplitNotFoundException(this._splitName);

  @override
  String toString() => 'SplitNotFoundException: $_splitName';
}
