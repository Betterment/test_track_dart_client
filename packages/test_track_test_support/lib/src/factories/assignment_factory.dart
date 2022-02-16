import 'package:random_string/random_string.dart';
import 'package:test_track/test_track.dart';

class AssignmentFactory {
  static Assignment build() {
    return Assignment(
      splitName: 'split-${randomAlphaNumeric(10)}',
      variant: 'variant-${randomAlphaNumeric(10)}',
      context: 'context-${randomAlphaNumeric(10)}',
    );
  }
}

extension AssignmentExtensions on Assignment {
  Assignment withSplitName(String splitName) {
    return copyWith(splitName: splitName);
  }

  Assignment withVariant(String variant) {
    return copyWith(variant: variant);
  }

  Assignment withContext(String context) {
    return copyWith(context: context);
  }
}
