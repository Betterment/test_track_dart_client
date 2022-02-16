import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/src/helpers/pair.dart';

/// A fake [AnalyticsProvider] that locally tracks all invocations to
/// [identify] and [trackAssignment] and provides a simple API for
/// querying those invocations
class FakeAnalyticsProvider implements AnalyticsProvider {
  /// Contains all visitor ids that were passed along with
  /// invocations of [identify]
  final _identifyInvocations = <String>[];

  /// Contains all invocations of [trackAssignment] represented as a
  /// [Pair] of visitor id to [Assignment]
  final _trackAssignmentInvocations = <Pair<String, Assignment>>[];

  List<Pair<String, Assignment>> get trackAssignmentInvocations => UnmodifiableListView(_trackAssignmentInvocations);
  List<String> get identifyInvocations => UnmodifiableListView(_identifyInvocations);

  @override
  Future<void> identify({required String visitorId}) async {
    _identifyInvocations.add(visitorId);
  }

  @override
  Future<void> trackAssignment({
    required String visitorId,
    required Assignment assignment,
  }) async {
    _trackAssignmentInvocations.add(Pair(visitorId, assignment));
  }

  /// True if [identify] was invoked with the provided visitor id
  bool identifyCalledWith(String visitorId) => _identifyInvocations.contains(visitorId);

  /// True if [identify] has not been called for the life of this
  /// [FakeAnalyticsProvider]
  bool identifyNotCalled() => _identifyInvocations.isEmpty;

  /// True if [trackAssignment] was invoked with this exact pair of
  /// visitor id and [Assignment]
  bool trackAssignmentCalledWith(Pair<String, Assignment> invocation) =>
      _trackAssignmentInvocations.contains(invocation);

  /// True if [trackAssignment] has not been called for the life
  /// of this [FakeAnalyticsProvider]
  bool trackAssignmentNotCalled() => _trackAssignmentInvocations.isEmpty;
}
