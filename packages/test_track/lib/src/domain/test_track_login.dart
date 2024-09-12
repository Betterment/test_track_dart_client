import 'package:sturdy_http/sturdy_http.dart';
import 'package:test_track/src/networking/extras.dart';
import 'package:test_track/test_track.dart';

/// {@template test_track_login}
///
/// Links the provided visitor ID with the provided [Identifier]
///
/// If the user associated with the provided [Identifier] already
/// has a visitor ID registered on the TestTrack server, the [Visitor]
/// returned in the [AppVisitorConfig] will contain their canonical visitor
/// id which should replace the temporary one created locally.
///
/// If this is a new TestTrack user, the provided visitor ID will be
/// associated with the provided [Identifier] going forward and will
/// be returned for subsequent calls to [Login]
///
/// If the linking fails, throws an
/// [TestTrackLoginFailureException].
///
/// If the linking is successful, the [Visitor] and [SplitRegistry]
/// contained within the associated [AppVisitorConfig] are persisted, and
/// the [DataStorageProvider] is notified of the new login state.
///
/// {@endtemplate}
class Login {
  final SturdyHttp _client;
  final DataStorageProvider _dataStorageProvider;
  final AnalyticsProvider _analyticsProvider;

  /// {@macro test_track_login}
  Login({
    required SturdyHttp httpClient,
    required DataStorageProvider dataStorageProvider,
    required AnalyticsProvider analyticsProvider,
  })  : _client = httpClient,
        _dataStorageProvider = dataStorageProvider,
        _analyticsProvider = analyticsProvider;

  /// {@macro test_track_login}
  Future<AppVisitorConfig> call({
    required Identifier identifier,
    required String visitorId,
    required AppVersionBuild appVersionBuild,
  }) async {
    final appVisitorConfig = await _client.execute<Json, AppVisitorConfig>(
      IdempotentPostRequest(
        '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
        data: NetworkRequestBody.json(
          {
            'identifier_type': identifier.identifierType,
            'value': identifier.value,
            'visitor_id': visitorId,
          },
        ),
      ),
      onResponse: (r) => switch (r) {
        Ok(:final response) => AppVisitorConfig.fromJson(response),
        _ => throw TestTrackLoginFailureException(message: r.toString()),
      },
    );

    await _dataStorageProvider.storeVisitor(appVisitorConfig.visitor);
    await _dataStorageProvider.storeSplitRegistry(appVisitorConfig.splitRegistry);
    await _dataStorageProvider.storeLoginState(true);

    await _analyticsProvider.identify(visitorId: appVisitorConfig.visitor.id);

    return appVisitorConfig;
  }
}

/// {@template test_track_login_failure_exception}
/// [TestTrackException] thrown when an attempt to [Login] fails
/// {@endtemplate}
class TestTrackLoginFailureException implements TestTrackException {
  /// A message associated with the [Login] failure, generally
  /// the reason for the failure
  final String? message;

  /// {@macro test_track_login_failure_exception}
  TestTrackLoginFailureException({this.message});
}
