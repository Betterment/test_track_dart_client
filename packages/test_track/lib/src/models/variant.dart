import 'package:dart_mappable/dart_mappable.dart';

part 'variant.mapper.dart';

/// {@template variant}
/// Represents a single experience or outcome within a split
///
/// For example, in a split named `homepage_redesign_q1_2022_experiment`,
/// you could have two [Variant]s, one called `control` and one called
/// `treatment`, where the visitors assigned to `control` would see
/// the legacy experience, and the visitors assigned to `treatment` would
/// see the new redesign. You might consider adding additional [Variant]s
/// of this experiment for various flavors of the redesign, to see which
/// one performs the best
/// {@endtemplate}
@MappableClass()
class Variant with VariantMappable {
  /// {@macro variant}
  const Variant({required this.name, required this.weight});

  /// The name of the variant
  final String name;

  /// The weight of the variant
  final int weight;
}
