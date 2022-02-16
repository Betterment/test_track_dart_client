import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:test_track/test_track.dart';

/// Given a visitor id and [Split], calculates the [Variant]
/// that should be assigned to the [TestTrack] visitor.
///
/// This operation is deterministic, meaning that if
/// it is invoked with the same visitor id and [Split],
/// it will produce the same result each time.
///
/// Throws an [AssignmentBucketOutOfRangeException] in
/// the event that the weights of the provided [Variant]s
/// do not push the visitor into the calculated assignment
/// bucket, which indicates the weights have been mis-
/// configured.
class CalculateVariant {
  Variant call({
    required String visitorId,
    required Split split,
  }) {
    var bucketCeiling = 0;
    final assignmentBucket = _assignmentBucket(visitorId, split);
    final sortedVariants = _sortedVariants(split);

    for (final variant in sortedVariants) {
      bucketCeiling += variant.weight;
      if (bucketCeiling > assignmentBucket) {
        return variant;
      }
    }

    throw AssignmentBucketOutOfRangeException();
  }

  String _splitVisitorHash(
    String visitorId,
    Split split,
  ) {
    return md5.convert(utf8.encode('${split.name}$visitorId')).toString();
  }

  int _hashFixNum(
    String visitorId,
    Split split,
  ) {
    final substring = _splitVisitorHash(visitorId, split).substring(0, 8);
    return int.parse(substring, radix: 16);
  }

  int _assignmentBucket(String visitorId, Split split) {
    return _hashFixNum(visitorId, split) % 100;
  }

  List<Variant> _sortedVariants(Split split) {
    return List.of(split.variants)
      ..sort(
        (a, b) => a.name.compareTo(b.name),
      );
  }
}
