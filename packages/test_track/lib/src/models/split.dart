// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/src/models/variant.dart';

part 'split.freezed.dart';
part 'split.g.dart';

/// {@template split}
/// A representation of a number of potential [Variant]s
/// that a TestTrack visitor could fall into. This could
/// be a feature gate with just two potential [Variant]s
/// or an experiment with many [Variant]s
/// {@endtemplate}
@freezed
class Split with _$Split {
  /// {@macro split}
  const factory Split({
    required String name,
    required List<Variant> variants,
    @JsonKey(name: 'feature_gate') required bool isFeatureGate,
  }) = _Split;

  // ignore: public_member_api_docs
  factory Split.fromJson(Map<String, dynamic> json) => _$SplitFromJson(json);
}
