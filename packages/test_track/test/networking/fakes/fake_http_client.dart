import 'package:charlatan/charlatan.dart';
import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

class FakeHttpClient extends HttpClient {
  FakeHttpClient(
    Charlatan charlatan,
  ) : super(
          baseUrl: 'http://localhost',
          customAdapter: charlatan.toFakeHttpClientAdapter(),
          logger: FakeTestTrackLogger.withoutNetworkLogging(),
        );
}
