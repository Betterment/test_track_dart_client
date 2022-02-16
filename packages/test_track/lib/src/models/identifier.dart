import 'package:freezed_annotation/freezed_annotation.dart';

part 'identifier.freezed.dart';
part 'identifier.g.dart';

@freezed
class Identifier with _$Identifier {
  const factory Identifier({
    required String identifierType,
    required String value,
  }) = _Identifier;

  factory Identifier.fromJson(Map<String, dynamic> json) => _$IdentifierFromJson(json);
}
