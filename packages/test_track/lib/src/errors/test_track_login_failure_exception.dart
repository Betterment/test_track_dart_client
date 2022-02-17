import 'package:test_track/src/errors/test_track_exception.dart';

class TestTrackLoginFailureException implements TestTrackException {
  final String? message;

  TestTrackLoginFailureException({this.message});
}
