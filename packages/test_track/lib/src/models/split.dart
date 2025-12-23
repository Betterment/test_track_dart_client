import 'package:dart_mappable/dart_mappable.dart';
import 'package:test_track/src/models/variant.dart';

part 'split.mapper.dart';

/// {@template split}
/// A representation of a number of potential [Variant]s
/// that a TestTrack visitor could fall into. This could
/// be a feature gate with just two potential [Variant]s
/// or an experiment with many [Variant]s
/// {@endtemplate}
@MappableClass()
class Split with SplitMappable {
  /// {@macro split}
  const Split({
    required this.name,
    required this.variants,
    required this.isFeatureGate,
  });

  /// The name of the split
  final String name;

  /// The list of potential [Variant]s for this split
  final List<Variant> variants;

  /// Whether this split is a feature gate
  @MappableField(key: 'feature_gate')
  final bool isFeatureGate;
}
