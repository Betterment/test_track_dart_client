import 'package:dart_mappable/dart_mappable.dart';

part 'identifier.mapper.dart';

/// {@template identifier}
/// Uniquely identifies a TestTrack visitor
/// {@endtemplate}
@MappableClass()
class Identifier with IdentifierMappable {
  /// {@macro identifier}
  const Identifier({required this.identifierType, required this.value});

  final String identifierType;
  final String value;
}
