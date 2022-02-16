import 'package:test_track/src/errors/test_track_exception.dart';

class SplitNotFoundException implements TestTrackException {
  final String splitName;

  SplitNotFoundException({required this.splitName});

  @override
  String toString() => 'SplitNotFoundException: $splitName';
}
