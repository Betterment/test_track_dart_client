import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/src/errors/errors.dart';
import 'package:test_track/src/models/split.dart';

part 'split_registry.freezed.dart';
part 'split_registry.g.dart';

@freezed
class SplitRegistry with _$SplitRegistry {
  factory SplitRegistry({required List<Split> splits}) = _SplitRegistry;

  factory SplitRegistry.fromJson(Map<String, dynamic> json) =>
      _$SplitRegistryFromJson(json);

  factory SplitRegistry.empty() => SplitRegistry(splits: []);
}

extension SplitRegistryExtension on SplitRegistry {
  Split findSplitByName(String name) {
    return splits.firstWhere(
      (s) => s.name == name,
      orElse: () {
        throw SplitNotFoundException(splitName: name);
      },
    );
  }
}
