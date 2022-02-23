import 'dart:collection';

import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/src/helpers/pair.dart';

/// A fake [AnalyticsProvider] whose state is populated when
/// [Assignment]s are tracked via [trackAssignment] and when
/// [Visitor] ids are identified via [identify]
class FakeAnalyticsProvider implements AnalyticsProvider {
  final _visitorsIdentified = <String>[];
  final _assignmentsTracked = <Pair<String, Assignment>>[];

  /// Returns a list of [Pair]s where each pair represents
  /// a tracked [Assignment]
  ///
  /// The first element in the [Pair] is the id of the [Visitor]
  /// the assigment belongs to, and the second element of the
  /// [Pair] is the [Assignment] itself
  List<Pair<String, Assignment>> get assignmentsTracked =>
      UnmodifiableListView(_assignmentsTracked);

  /// Returns a list of [String]s representing the [Visitor]s
  /// identified, where each [String] in the list is the id
  /// of the identified [Visitor]
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

  /// True if the provided [Visitor] id was identified
  bool identified({required String visitorId}) =>
      _visitorsIdentified.contains(visitorId);

  /// True if no [Visitor]s have been identified
  bool noVisitorsIdentified() => _visitorsIdentified.isEmpty;

  /// True if the provided [Visitor] id and [Assignment] were
  /// tracked
  bool tracked({required Pair<String, Assignment> assignment}) =>
      _assignmentsTracked.contains(assignment);

  /// True if no [Assignment]s have been tracked
  bool noAssignmentsTracked() => _assignmentsTracked.isEmpty;
}
