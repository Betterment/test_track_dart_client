import 'package:test_track/test_track.dart';

/// Produced as the result of running an Ab
class RunAbResult {
  /// Whether the user fell into the true variant bucket
  final bool isTrueVariant;

  // The resulting [Visitor] after the results
  // of the Ab have been applied
  final Visitor visitor;

  // ignore: avoid_positional_boolean_parameters
  RunAbResult(this.isTrueVariant, this.visitor);
}
