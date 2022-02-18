import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant.freezed.dart';
part 'variant.g.dart';

@freezed
class Variant with _$Variant {
  const factory Variant({
    required String name,
    required int weight,
  }) = _Variant;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);
}
