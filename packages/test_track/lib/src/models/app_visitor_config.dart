import 'package:dart_mappable/dart_mappable.dart';
import 'package:test_track/src/models/split.dart';
import 'package:test_track/src/models/split_registry.dart';
import 'package:test_track/src/models/visitor.dart';

part 'app_visitor_config.mapper.dart';

/// {@template app_visitor_config}
/// Represents the configuration that will dictate
/// user experience in your application based on the
/// current [Visitor] and their [Split]s
/// {@endtemplate}
@MappableClass()
class AppVisitorConfig with AppVisitorConfigMappable {
  /// {@macro app_visitor_config}
  const AppVisitorConfig({required this.splits, required this.visitor});

  /// The list of [Split]s associated with the current visitor
  final List<Split> splits;

  /// The current [Visitor]
  final Visitor visitor;
}

// ignore: public_member_api_docs
extension AppVisitorConfigExtension on AppVisitorConfig {
  /// A [SplitRegistry] produced by wrapping this [AppVisitorConfig]s
  /// [Split]s
  SplitRegistry get splitRegistry => SplitRegistry(splits: splits);
}
