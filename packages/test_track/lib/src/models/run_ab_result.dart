import 'package:test_track/test_track.dart';

/// {@template run_ab_result}
/// An object representing the result of running
/// an `ab`.
/// {@endtemplate}
class RunAbResult {
  /// Whether the user fell into the true variant bucket
  final bool isTrueVariant;

  /// The resulting [Visitor] after the results
  /// of the Ab have been applied
  final Visitor visitor;

  /// {@macro run_ab_result}
  // ignore: avoid_positional_boolean_parameters
  RunAbResult(this.isTrueVariant, this.visitor);
}
