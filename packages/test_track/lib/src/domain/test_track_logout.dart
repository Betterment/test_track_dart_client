import 'package:test_track/test_track.dart';

/// {@template test_track_logout}
///
/// Logs the current user out of the test track client by
/// writing over their data with a fresh [Visitor] and
/// returns the fresh [Visitor]. Additionally, indicates
/// the new login state to the [DataStorageProvider].
///
/// Also, invokes [AnalyticsProvider.identify] with the id
/// of the newly generated [Visitor]
///
/// {@endtemplate}
class Logout {
  final DataStorageProvider _dataStorageProvider;
  final AnalyticsProvider _analyticsProvider;

  /// {@macro test_track_logout}
  Logout({
    required DataStorageProvider dataStorageProvider,
    required AnalyticsProvider analyticsProvider,
  })  : _dataStorageProvider = dataStorageProvider,
        _analyticsProvider = analyticsProvider;

  /// {@macro test_track_logout}
  Future<Visitor> call() async {
    final newVisitor = Visitor.build();

    await _dataStorageProvider.storeVisitor(newVisitor);
    await _dataStorageProvider.storeLoginState(false);
    await _analyticsProvider.identify(visitorId: newVisitor.id);

    return newVisitor;
  }
}
