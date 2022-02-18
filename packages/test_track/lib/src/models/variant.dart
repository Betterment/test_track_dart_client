import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant.freezed.dart';
part 'variant.g.dart';

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
@freezed
class Variant with _$Variant {
  /// {@macro variant}
  const factory Variant({
    required String name,
    required int weight,
  }) = _Variant;

  // ignore: public_member_api_docs
  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);
}
