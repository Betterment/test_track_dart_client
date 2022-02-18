import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track/test_track.dart';

class GetVisitorConfig {
  final HttpClient _client;
  final AnalyticsProvider _analyticsProvider;
  final DataStorageProvider _dataStorageProvider;

  GetVisitorConfig({
    required HttpClient client,
    required AnalyticsProvider analyticsProvider,
    required DataStorageProvider dataStorageProvider,
  })  : _client = client,
        _analyticsProvider = analyticsProvider,
        _dataStorageProvider = dataStorageProvider;

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
