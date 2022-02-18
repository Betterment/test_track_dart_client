import 'dart:math' show Random;

import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';

/// {@template variant_factory}
/// Produces [Variant]s to be used for
/// testing
/// {@endtemplate}
class VariantFactory {
  /// {@macro variant_factory}
  static Variant build() {
    return Variant(
      name: 'variant-${randomAlphaNumeric(10)}',
      weight: Random().nextInt(100),
    );
  }
}

/// Supported modifications for [Variant]s
extension VariantExtensions on Variant {
  /// Returns a copy of this [Variant] with the new name
  Variant withName(String name) {
    return copyWith(name: name);
  }

  /// Returns a copy of this [Variant] with the new weight
  Variant withWeight(int weight) {
    return copyWith(weight: weight);
  }
}
