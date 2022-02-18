import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

/// {@template app_visitor_config_factory}
/// Produces [AppVisitorConfig]s to be used for
/// testing
/// {@endtemplate}
class AppVisitorConfigFactory {
  /// {@macro app_visitor_config_factory}
  static AppVisitorConfig build() {
    return AppVisitorConfig(
      splits: List.generate(10, (index) => SplitFactory.build()),
      visitor: VisitorFactory.build(),
    );
  }
}
