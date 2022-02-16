import 'package:test_track/src/errors/test_track_exception.dart';

class FailedToLoginException implements TestTrackException {
  final String? message;

  FailedToLoginException({this.message});
}
