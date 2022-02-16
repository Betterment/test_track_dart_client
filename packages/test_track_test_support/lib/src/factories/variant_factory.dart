import 'dart:math' show Random;

import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';

class VariantFactory {
  static Variant build() {
    return Variant(
      name: 'variant-${randomAlphaNumeric(10)}',
      weight: Random().nextInt(100),
    );
  }
}

extension VariantExtensions on Variant {
  Variant withName(String name) {
    return copyWith(name: name);
  }

  Variant withWeight(int weight) {
    return copyWith(weight: weight);
  }
}
