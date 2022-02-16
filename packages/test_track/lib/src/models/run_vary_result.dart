import 'package:test_track/test_track.dart';

/// Produced as the result of running a Vary
class RunVaryResult {
  /// The name of the outcome [Variant] of running the Vary
  final String variant;

  // The resulting [Visitor] after the results
  // of the Vary have been applied
  final Visitor visitor;

  RunVaryResult(this.variant, this.visitor);
}
