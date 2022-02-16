import 'package:test/test.dart';
import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('HttpClient', () {
    test('baseUrl', () {
      final subject = HttpClient(
        baseUrl: 'testurl.com',
        logger: FakeTestTrackLogger.withoutNetworkLogging(),
      );

      expect(subject.baseUrl, 'testurl.com');
    });
  });
}
