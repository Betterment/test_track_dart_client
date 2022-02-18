import 'package:dio/dio.dart';
import 'package:test_track/src/networking/http_client.dart';
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
/// [UnableToFetchAppVisitorConfigDefaultingToCacheException].
///
/// If the linking is successful, the [Visitor] and [SplitRegistry]
/// contained within the associated [AppVisitorConfig] are persisted.
///
/// {@endtemplate}
class Login {
  final HttpClient _client;
  final DataStorageProvider _dataStorageProvider;
  final AnalyticsProvider _analyticsProvider;

  Login({
    required HttpClient httpClient,
    required DataStorageProvider dataStorageProvider,
    required AnalyticsProvider analyticsProvider,
  })  : _client = httpClient,
        _dataStorageProvider = dataStorageProvider,
        _analyticsProvider = analyticsProvider;

  Future<AppVisitorConfig> call({
    required Identifier identifier,
    required String visitorId,
    required AppVersionBuild appVersionBuild,
  }) async {
    late Response<Map<String, dynamic>> response;
    try {
      response = await _client.post<Map<String, dynamic>>(
        '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/identifier',
        data: {
          'identifier_type': identifier.identifierType,
          'value': identifier.value,
          'visitor_id': visitorId,
        },
        isIdempotent: true,
      );
    } on DioError catch (e) {
      throw UnableToFetchAppVisitorConfigDefaultingToCacheException(
        message: e.message,
      );
    }

    final appVisitorConfig = AppVisitorConfig.fromJson(response.data!);

    await _dataStorageProvider.storeVisitor(appVisitorConfig.visitor);
    await _dataStorageProvider
        .storeSplitRegistry(appVisitorConfig.splitRegistry);

    await _analyticsProvider.identify(visitorId: appVisitorConfig.visitor.id);

    return appVisitorConfig;
  }
}
