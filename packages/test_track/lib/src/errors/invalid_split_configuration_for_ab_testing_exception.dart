import 'package:test_track/src/errors/test_track_exception.dart';

class InvalidSplitConfigurationForAbTestingException implements TestTrackException {
  final String splitName;

  InvalidSplitConfigurationForAbTestingException({required this.splitName});

  @override
  String toString() => 'InvalidSplitConfigurationForAbTestingException: splitName: $splitName';
}
