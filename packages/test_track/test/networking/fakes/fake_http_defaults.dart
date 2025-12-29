import 'package:charlatan/charlatan.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

extension FakeHttpDefaults on Charlatan {
  /// Sets up reasonable default fake responses for all the endpoints our app will interact with.
  ///
  /// If you encounter an endpoint that doesn't have a default response defined here, you should add it.
  ///
  /// Note: if you are writing a test and you care about a specific attribute or configuration of a response, then
  /// you should configure your test with a custom response for that endpoint. You can do that by building an instance
  /// of [Charlatan], applying this [withDefaults] method, and then calling the appropriate [whenGet],
  /// [whenPost], [whenPut], or [whenDelete] method to override the default response. That will ensure that your test
  /// is not coupled to the default responses in a brittle way.
  void withDefaults() {
    this
      ..whenGetVisitorConfig(response: AppVisitorConfigFactory.build())
      ..whenPost(
        '/api/v1/assignment_event',
        (request) => CharlatanHttpResponse(),
      );
  }

  /// Convenience method to set the returned
  /// [AppVisitorConfig] when `/config` is called
  /// on a [Charlatan]
  void whenGetVisitorConfig({required AppVisitorConfig response}) {
    whenGet(
      '/api/v4/apps/{appName}/versions/{version}/builds/{buildTimestamp}/visitors/{visitorId}/config',
      (request) => CharlatanHttpResponse(body: response.toMap()),
    );
  }

  /// Convenience method to return a 500 status code
  /// `/config` is called on a [Charlatan]
  void whenGetVisitorConfigFails() {
    whenGet(
      '/api/v4/apps/{appName}/versions/{version}/builds/{buildTimestamp}/visitors/{visitorId}/config',
      (request) => CharlatanHttpResponse(statusCode: 500),
    );
  }
}
