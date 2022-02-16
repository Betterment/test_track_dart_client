import 'package:test_track/src/errors/test_track_exception.dart';

class UnableToFetchAppVisitorConfigDefaultingToCacheException implements TestTrackException {
  final String? message;

  UnableToFetchAppVisitorConfigDefaultingToCacheException({this.message});
}
