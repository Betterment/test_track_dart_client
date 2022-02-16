import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/src/models/variant.dart';

part 'split.freezed.dart';
part 'split.g.dart';

@freezed
class Split with _$Split {
  const factory Split({
    required String name,
    required List<Variant> variants,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'feature_gate') required bool isFeatureGate,
  }) = _Split;

  factory Split.fromJson(Map<String, dynamic> json) => _$SplitFromJson(json);
}
