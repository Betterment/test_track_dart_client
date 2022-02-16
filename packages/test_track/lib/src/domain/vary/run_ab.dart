import 'package:collection/collection.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/src/errors/errors.dart';
import 'package:test_track/src/models/models.dart';

/// {@template run_ab}
///
/// Runs a [RunVary] and returns true if the returned
/// [Variant] is the true variant either provided
/// by the caller or 'true' if not provided.
///
/// If the [Split] contains a single [Variant],
/// returns true if that variant is the true [Variant]
/// and false otherwise
///
/// If the [Split] provided contains more than 2
/// [Variant]s, throws an
/// [InvalidSplitConfigurationForAbTestingException].
///
/// {@endtemplate}
class RunAb {
  final RunVary _runVary;

  RunAb({required RunVary runVary}) : _runVary = runVary;

  RunAbResult call({
    required Visitor visitor,
    required Split split,
    required String context,
    String? trueVariant,
  }) {
    if (split.variants.length > 2) {
      throw InvalidSplitConfigurationForAbTestingException(
        splitName: split.name,
      );
    }

    final _trueVariant = trueVariant ?? 'true';
    final unsortedVariants = List.of(split.variants);
    final sortedFalseVariants = unsortedVariants
      ..sort((v1, v2) => v1.name.compareTo(v2.name))
      ..removeWhere((v) => v.name == _trueVariant);

    final falseVariant = sortedFalseVariants.firstOrNull?.name;

    final runVaryResult = _runVary(
      visitor: visitor,
      split: split,
      defaultVariant: falseVariant ?? 'false',
      context: context,
    );

    return RunAbResult(
      _trueVariant == runVaryResult.variant,
      runVaryResult.visitor,
    );
  }
}
