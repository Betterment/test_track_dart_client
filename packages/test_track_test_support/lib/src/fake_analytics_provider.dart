import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/src/helpers/pair.dart';

/// A fake [AnalyticsProvider] that locally tracks all invocations to
/// [identify] and [trackAssignment] and provides a simple API for
/// querying those invocations
class FakeAnalyticsProvider implements AnalyticsProvider {
  final _visitorsIdentified = <String>[];
  final _assignmentsTracked = <Pair<String, Assignment>>[];

  /// Returns a list of [Pair]s representing invocations produced
  /// by calls to [trackAssignment] where the first item in each
  /// [Pair] is the id of the [Visitor] with the new assignment
  /// and the second item in the [Pair] is the [Assignment] that was
  /// created
  List<Pair<String, Assignment>> get assignmentsTracked =>
      UnmodifiableListView(_assignmentsTracked);

  /// Returns a list of [String]s representing invocations produced
  /// by calls to [identify] where each [String] is the id
  /// of the [Visitor]
  List<String> get visitorsIdentified =>
      UnmodifiableListView(_visitorsIdentified);

  @override
  Future<void> identify({required String visitorId}) async {
    _visitorsIdentified.add(visitorId);
  }

  @override
  Future<void> trackAssignment({
    required String visitorId,
    required Assignment assignment,
  }) async {
    _assignmentsTracked.add(Pair(visitorId, assignment));
  }

  /// True if [identify] was invoked with the provided visitor id
  bool identified({required String visitorId}) =>
      _visitorsIdentified.contains(visitorId);

  /// True if [identify] has not been called for the life of this
  /// [FakeAnalyticsProvider]
  bool noVisitorsIdentified() => _visitorsIdentified.isEmpty;

  /// True if [trackAssignment] was invoked with this exact pair of
  /// visitor id and [Assignment]
  bool tracked({required Pair<String, Assignment> assignment}) =>
      _assignmentsTracked.contains(assignment);

  /// True if [trackAssignment] has not been called for the life
  /// of this [FakeAnalyticsProvider]
  bool noAssignmentsTracked() => _assignmentsTracked.isEmpty;
}
