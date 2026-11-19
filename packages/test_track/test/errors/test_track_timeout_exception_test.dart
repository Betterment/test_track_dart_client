import 'package:test/test.dart';
import 'package:test_track/test_track.dart';

void main() {
  test('TestTrackTimeoutException toString includes the milliseconds', () {
    expect(
      const TestTrackTimeoutException(Duration(seconds: 5)).toString(),
      contains('5000 ms'),
    );
  });
}
