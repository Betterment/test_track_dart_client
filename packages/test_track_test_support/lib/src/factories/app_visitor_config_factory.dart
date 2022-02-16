import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

class AppVisitorConfigFactory {
  static AppVisitorConfig build() {
    return AppVisitorConfig(
      splits: List.generate(10, (index) => SplitFactory.build()),
      visitor: VisitorFactory.build(),
    );
  }
}
