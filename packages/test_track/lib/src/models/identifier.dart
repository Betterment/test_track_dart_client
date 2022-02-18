import 'package:freezed_annotation/freezed_annotation.dart';

part 'identifier.freezed.dart';
part 'identifier.g.dart';

/// {@template identifier}
/// Uniquely identifies a TestTrack visitor
/// {@endtemplate}
@freezed
class Identifier with _$Identifier {
  /// {@macro identifier}
  const factory Identifier({
    required String identifierType,
    required String value,
  }) = _Identifier;

  // ignore: public_member_api_docs
  factory Identifier.fromJson(Map<String, dynamic> json) =>
      _$IdentifierFromJson(json);
}
