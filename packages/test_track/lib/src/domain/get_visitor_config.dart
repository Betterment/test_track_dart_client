import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track/test_track.dart';

/// {@template get_visitor_config}
/// Responsible for fetching an up-to-date [AppVisitorConfig]
/// from the TestTrack server given the provided [Visitor] id
/// and [AppVersionBuild]
///
/// If the fetch is successful, the [Visitor] and [SplitRegistry]
/// contained within the [AppVisitorConfig] will be stored
/// in storage via the injected [DataStorageProvider]. Also,
/// [AnalyticsProvider.identify] will be invoked with the
/// [Visitor] id from the [AppVisitorConfig].
///
/// If the fetch is not successful, a DioError will be thrown
/// {@endtemplate}
class GetVisitorConfig {
  final HttpClient _client;
  final AnalyticsProvider _analyticsProvider;
  final DataStorageProvider _dataStorageProvider;

  /// {@macro get_visitor_config}
  GetVisitorConfig({
    required HttpClient client,
    required AnalyticsProvider analyticsProvider,
    required DataStorageProvider dataStorageProvider,
  })  : _client = client,
        _analyticsProvider = analyticsProvider,
        _dataStorageProvider = dataStorageProvider;

  /// {@macro get_visitor_config}
  Future<AppVisitorConfig> call({
    required String visitorId,
    required AppVersionBuild appVersionBuild,
  }) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/api/v4/apps/${appVersionBuild.appName}/versions/${appVersionBuild.version}/builds/${appVersionBuild.buildTimestamp}/visitors/$visitorId/config',
    );

    final appVisitorConfig = AppVisitorConfig.fromJson(response.data!);

    await _dataStorageProvider.storeVisitor(appVisitorConfig.visitor);
    await _dataStorageProvider
        .storeSplitRegistry(appVisitorConfig.splitRegistry);

    await _analyticsProvider.identify(visitorId: appVisitorConfig.visitor.id);

    return appVisitorConfig;
  }
}
