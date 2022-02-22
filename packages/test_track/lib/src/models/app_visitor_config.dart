import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/src/models/split.dart';
import 'package:test_track/src/models/split_registry.dart';
import 'package:test_track/src/models/visitor.dart';

part 'app_visitor_config.freezed.dart';
part 'app_visitor_config.g.dart';

/// {@template app_visitor_config}
/// Represents the configuration that will dictate
/// user experience in your application based on the
/// current [Visitor] and their [Split]s
/// {@endtemplate}
@freezed
class AppVisitorConfig with _$AppVisitorConfig {
  /// {@macro app_visitor_config}
  const factory AppVisitorConfig({
    required List<Split> splits,
    required Visitor visitor,
  }) = _AppVisitorConfig;

  // ignore: public_member_api_docs
  factory AppVisitorConfig.fromJson(Map<String, dynamic> json) =>
      _$AppVisitorConfigFromJson(json);
}

// ignore: public_member_api_docs
extension AppVisitorConfigExtension on AppVisitorConfig {
  /// A [SplitRegistry] produced by wrapping this [AppVisitorConfig]s
  /// [Split]s
  SplitRegistry get splitRegistry => SplitRegistry(splits: splits);
}
