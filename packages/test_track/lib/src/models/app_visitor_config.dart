import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/src/models/split.dart';
import 'package:test_track/src/models/split_registry.dart';
import 'package:test_track/src/models/visitor.dart';

part 'app_visitor_config.freezed.dart';
part 'app_visitor_config.g.dart';

@freezed
class AppVisitorConfig with _$AppVisitorConfig {
  const factory AppVisitorConfig({
    required List<Split> splits,
    required Visitor visitor,
  }) = _AppVisitorConfig;

  factory AppVisitorConfig.fromJson(Map<String, dynamic> json) =>
      _$AppVisitorConfigFromJson(json);
}

extension AppVisitorConfigExtension on AppVisitorConfig {
  SplitRegistry get splitRegistry => SplitRegistry(splits: splits);
}
