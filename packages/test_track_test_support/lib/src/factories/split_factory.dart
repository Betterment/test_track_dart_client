import 'dart:math';

import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

class SplitFactory {
  static Split build({bool? isFeatureGate}) {
    final _isFeatureGate = isFeatureGate ?? Random().nextBool();
    final variants = () {
      if (_isFeatureGate) {
        return const [
          Variant(name: 'true', weight: 50),
          Variant(name: 'false', weight: 50),
        ];
      } else {
        final firstWeight = Random().nextInt(80);
        final secondWeight = ((100 - firstWeight) / max(2, Random().nextInt(9))).floor();
        final thirdWeight = 100 - firstWeight - secondWeight;

        return [
          VariantFactory.build().withWeight(firstWeight),
          VariantFactory.build().withWeight(secondWeight),
          VariantFactory.build().withWeight(thirdWeight),
        ];
      }
    }();

    return Split(
      name: _isFeatureGate ? 'split-${randomAlphaNumeric(10)}_enabled' : 'split-${randomAlphaNumeric(10)}_experiment',
      variants: variants,
      isFeatureGate: _isFeatureGate,
    );
  }
}

extension SplitExtensions on Split {
  Split withName(String name) {
    return copyWith(name: name);
  }

  Split withVariants(List<Variant> variants) {
    return copyWith(variants: variants);
  }
}
