import 'package:test_track/test_track.dart';

/// {@template test_track_logout}
///
/// Logs the current user out of the test track client by
/// writing over their data with a fresh [Visitor] and
/// returns the fresh [Visitor]
///
/// {@endtemplate}
class Logout {
  final DataStorageProvider _dataStorageProvider;
  final AnalyticsProvider _analyticsProvider;

  Logout({
    required DataStorageProvider dataStorageProvider,
    required AnalyticsProvider analyticsProvider,
  })  : _dataStorageProvider = dataStorageProvider,
        _analyticsProvider = analyticsProvider;

  Future<Visitor> call() async {
    final newVisitor = Visitor.build();

    await _dataStorageProvider.storeVisitor(newVisitor);
    await _analyticsProvider.identify(visitorId: newVisitor.id);

    return newVisitor;
  }
}
