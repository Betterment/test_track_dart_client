import 'package:dart_mappable/dart_mappable.dart';

part 'identifier.mapper.dart';

/// {@template identifier}
/// Uniquely identifies a TestTrack visitor
/// {@endtemplate}
@MappableClass()
class Identifier with IdentifierMappable {
  /// {@macro identifier}
  const Identifier({required this.identifierType, required this.value});

  /// The type of identifier (e.g., "user_id")
  final String identifierType;

  /// The value of the identifier (e.g., "12345")
  final String value;
}
