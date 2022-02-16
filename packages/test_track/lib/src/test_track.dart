import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_track/src/analytics/analytics_provider.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/src/domain/test_track_logout.dart';
import 'package:test_track/src/errors/default_to_cache_exception.dart';
import 'package:test_track/src/logging/default_test_track_logger.dart';
import 'package:test_track/src/logging/test_track_logger.dart';
import 'package:test_track/src/models/models.dart';
import 'package:test_track/src/networking/http_client.dart';
import 'package:test_track/src/persistence/persistence.dart';

/// The instance with which to interact to perform
/// client-side split-testing and feature-toggling.
///
/// To initialize and begin using the instance, invoke
/// and `await` [initialize] with the required arguments.
class TestTrack {
  /// Initializes a [TestTrack] instance with the
  /// required dependencies.
  ///
  /// If they exist, a [Visitor] and [SplitRegistry] will
  /// be fetched from cache, and an attempt will be made
  /// to fetch the latest [AppVisitorConfig] from the
  /// server. If this fails, the [TestTrack] instance
  /// will be instantiated with the cached version, or
  /// a new [Visitor] and empty [SplitRegistry] in the
  /// case that they couldn't be located in cache.
  static Future<TestTrack> initialize({
    required String baseUrl,
    required AppVersionBuild appVersionBuild,
    required DataStorageProvider dataStorageProvider,
    required AnalyticsProvider analyticsProvider,
    HttpClientAdapter? customHttpAdapter,
    TestTrackLogger? logger,
  }) async {
    final _logger = logger ?? const SilentTestTrackLogger();

    final client = HttpClient(
      baseUrl: baseUrl,
      logger: _logger,
      customAdapter: customHttpAdapter,
    );

    final getVisitorConfig = GetVisitorConfig(
      client: client,
      analyticsProvider: analyticsProvider,
      dataStorageProvider: dataStorageProvider,
    );
    final reportAssignmentEvent = ReportAssignmentEvent(
      client: client,
      logger: _logger,
    );
    final overrideAssignments = OverrideAssignments(
      client: client,
      getVisitorConfig: getVisitorConfig,
    );
    final login = Login(
      httpClient: client,
      dataStorageProvider: dataStorageProvider,
      analyticsProvider: analyticsProvider,
    );

    final logout = Logout(
      dataStorageProvider: dataStorageProvider,
      analyticsProvider: analyticsProvider,
    );

    final runVary = RunVary(
      calculateVariant: CalculateVariant(),
      analyticsProvider: analyticsProvider,
      reportAssignmentEvent: reportAssignmentEvent,
      dataStorageProvider: dataStorageProvider,
    );

    final runAb = RunAb(runVary: runVary);

    await dataStorageProvider.initialize();

    var visitor = await dataStorageProvider.fetchVisitor() ?? Visitor.build();
    var splitRegistry = await dataStorageProvider.fetchSplitRegistry() ?? SplitRegistry.empty();

    AppVisitorConfig? appVisitorConfig;
    try {
      appVisitorConfig = await getVisitorConfig(
        visitorId: visitor.id,
        appVersionBuild: appVersionBuild,
      );

      visitor = appVisitorConfig.visitor;
      splitRegistry = appVisitorConfig.splitRegistry;
    } on DioError catch (e) {
      _logger.info(
        'Failed to fetch app visitor config from server, using cached data',
        error: e.message,
        stackTrace: e.stackTrace,
      );
    }

    await dataStorageProvider.storeVisitor(visitor);
    await dataStorageProvider.storeSplitRegistry(splitRegistry);

    return TestTrack._(
      appVersionBuild,
      overrideAssignments,
      login,
      logout,
      runVary,
      runAb,
      _logger,
      visitor,
      splitRegistry,
    );
  }

  final AppVersionBuild _appVersionBuild;
  final OverrideAssignments _overrideAssignments;
  final Login _login;
  final Logout _logout;
  final RunVary _runVary;
  final RunAb _runAb;
  final TestTrackLogger _logger;
  Visitor _visitor;
  SplitRegistry _splitRegistry;

  TestTrack._(
    this._appVersionBuild,
    this._overrideAssignments,
    this._login,
    this._logout,
    this._runVary,
    this._runAb,
    this._logger,
    this._visitor,
    this._splitRegistry,
  );

  /// The current [Visitor]s [Assignments]
  List<Assignment> get visitorAssignments => _visitor.assignments;

  /// The current [Visitor]
  Visitor get visitor => _visitor;

  /// The current [SplitRegistry]
  SplitRegistry get splitRegistry => _splitRegistry;

  /// {@macro test_track_login}
  Future<void> login({
    required String identifierType,
    required String value,
  }) async {
    try {
      final appVisitorConfig = await _login(
        identifier: Identifier(identifierType: identifierType, value: value),
        visitorId: _visitor.id,
        appVersionBuild: _appVersionBuild,
      );
      _updateAppVisitorConfig(appVisitorConfig);
    } on TestTrackLoginFailureException catch (e) {
      _logger.info(
        'Failed to login user, continuing to use existing app visitor config',
        error: e.message,
      );
    }
  }

  /// {@macro test_track_logout}
  Future<void> logout() async {
    final newVisitor = await _logout();

    _updateVisitor(newVisitor);
  }

  /// {@macro override_assignments}
  Future<void> createAssignmentOverrides({
    required List<AssignmentOverride> assignmentOverrides,
  }) async {
    final appVisitorConfig = await _overrideAssignments(
      appVersionBuild: _appVersionBuild,
      visitorId: _visitor.id,
      assignmentOverrides: assignmentOverrides,
    );
    _updateAppVisitorConfig(appVisitorConfig);
  }

  /// {@macro run_ab}
  bool ab({
    required String splitName,
    required String context,
    String? trueVariant,
  }) {
    final split = _splitRegistry.findSplitByName(splitName);
    final runAbResult = _runAb(
      visitor: visitor,
      split: split,
      context: context,
      trueVariant: trueVariant,
    );
    _updateVisitor(runAbResult.visitor);
    return runAbResult.isTrueVariant;
  }

  /// {@macro run_vary}
  String vary({
    required String splitName,
    required String defaultVariant,
    required String context,
  }) {
    final split = _splitRegistry.findSplitByName(splitName);

    final runVaryResult = _runVary(
      visitor: visitor,
      split: split,
      defaultVariant: defaultVariant,
      context: context,
    );
    _updateVisitor(runVaryResult.visitor);
    return runVaryResult.variant;
  }

  /// A convenience function used instead of calling both [_updateVisitor]
  /// and [_updateSplitRegistry], useful for when both change.
  ///
  /// Should be called whenever the [AppVisitorConfig] changes so we can
  /// locally track the latest value.
  void _updateAppVisitorConfig(AppVisitorConfig appVisitorConfig) {
    _updateVisitor(appVisitorConfig.visitor);
    _updateSplitRegistry(appVisitorConfig.splitRegistry);
  }

  /// Updates the instance member [_visitor] with the new
  /// [visitor]
  // ignore: use_setters_to_change_properties
  void _updateVisitor(Visitor visitor) {
    _visitor = visitor;
  }

  /// Updates the instance member [_splitRegistry] with the new
  /// [splitRegistry]
  // ignore: use_setters_to_change_properties
  void _updateSplitRegistry(SplitRegistry splitRegistry) {
    _splitRegistry = splitRegistry;
  }
}
