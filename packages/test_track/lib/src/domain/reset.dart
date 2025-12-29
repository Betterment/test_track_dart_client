import 'package:test_track/test_track.dart';

/// {@template test_track_reset}
///
/// Resets all state by replacing stored visitor with
/// a fresh [Visitor]. Additionally, indicates that the user
/// has been logged out to the [DataStorageProvider].
///
/// Lastly, invokes [AnalyticsProvider.identify] with the id
/// of the newly generated [Visitor] and returns the [Visitor].
///
/// If the desire is to preserve the id of the current [Visitor],
/// use `logout` instead.
///
/// {@endtemplate}
class Reset {
  final DataStorageProvider _dataStorageProvider;
  final AnalyticsProvider _analyticsProvider;

  /// {@macro test_track_reset}
  Reset({
    required DataStorageProvider dataStorageProvider,
    required AnalyticsProvider analyticsProvider,
  }) : _dataStorageProvider = dataStorageProvider,
       _analyticsProvider = analyticsProvider;

  /// {@macro test_track_reset}
  Future<Visitor> call() async {
    final newVisitor = Visitor.build();

    await _dataStorageProvider.storeVisitor(newVisitor);
    await _dataStorageProvider.storeLoginState(false);
    await _analyticsProvider.identify(visitorId: newVisitor.id);

    return newVisitor;
  }
}
