import 'package:test_track/test_track.dart';

Future<void> main() async {
  // Make sure you have configured a valid TestTrack server.
  final testTrack = await TestTrack.initialize(
    baseUrl: 'https://testtrack.test',
    // Populate build info based on your app's name, version, and build time.
    // The `appName` should correspond to the application you create in your
    // TestTrack server for this project.
    // The `versions` and `buildTimestamp` should change with each new version
    // of your app to ensure that server-powered feature completion and remote
    // kill functionality behaves as intended.
    appVersionBuild: AppVersionBuild(
      appName: 'example',
      version: '0.0.1',
      buildTimestamp: '2020-01-01T00:00:00Z',
    ),
    // Implement a storage provider to act as a local cache.
    dataStorageProvider: DummyDataStorageProvider(),
    // Implement an analytics provider to track experiments.
    analyticsProvider: DummyAnalyticsProvider(),
  );

  // Use `ab` to check if a feature is enabled. It will return true if the
  // feature is enabled for the current visitor.
  if (testTrack.ab(
    splitName: 'some_feature_flag_enabled',
    context: 'app startup',
  )) {
    // Do something!
  } else {
    // Do something else!
  }
}

class DummyDataStorageProvider implements DataStorageProvider {
  Visitor? _visitor;
  SplitRegistry? _splitRegistry;
  bool _isLoggedIn = false;

  @override
  Future<SplitRegistry?> fetchSplitRegistry() async {
    return _splitRegistry;
  }

  @override
  Future<Visitor?> fetchVisitor() async {
    return _visitor;
  }

  @override
  Future<void> initialize() async {
    // Load the visitor and split registry from local storage.
  }

  @override
  Future<void> storeSplitRegistry(SplitRegistry splitRegistry) async {
    _splitRegistry = splitRegistry;
  }

  @override
  Future<void> storeVisitor(Visitor visitor) async {
    _visitor = visitor;
  }

  @override
  Future<void> storeLoginState(bool isLoggedIn) async {
    _isLoggedIn = isLoggedIn;
  }

  @override
  Future<bool> fetchLoginState() async {
    return _isLoggedIn;
  }
}

class DummyAnalyticsProvider implements AnalyticsProvider {
  @override
  Future<void> identify({required String visitorId}) async {
    // Send an event to your analytics service!
  }

  @override
  Future<void> trackAssignment({
    required String visitorId,
    required Assignment assignment,
  }) async {
    // Send an event to your analytics service!
  }
}
