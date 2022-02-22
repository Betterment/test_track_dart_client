import 'package:test_track/test_track.dart';

/// {@template run_vary_result}
/// An object representing the result of running
/// a `vary`.
/// {@endtemplate}
class RunVaryResult {
  /// The name of the outcome [Variant] of running the Vary
  final String variant;

  /// The resulting [Visitor] after the results
  /// of the Vary have been applied
  final Visitor visitor;

  /// {@macro run_vary_result}
  RunVaryResult(this.variant, this.visitor);
}
