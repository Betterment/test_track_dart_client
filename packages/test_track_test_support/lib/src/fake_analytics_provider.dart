import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/src/helpers/pair.dart';

/// A fake [AnalyticsProvider] that locally tracks all invocations to
/// [identify] and [trackAssignment] and provides a simple API for
/// querying those invocations
class FakeAnalyticsProvider implements AnalyticsProvider {
  final _identifyInvocations = <String>[];
  final _trackAssignmentInvocations = <Pair<String, Assignment>>[];

  /// Returns a list of [Pair]s representing invocations produced
  /// by calls to [trackAssignment] where the first item in each
  /// [Pair] is the id of the [Visitor] with the new assignment
  /// and the second item in the [Pair] is the [Assignment] that was
  /// created
  List<Pair<String, Assignment>> get trackAssignmentInvocations =>
      UnmodifiableListView(_trackAssignmentInvocations);

  /// Returns a list of [String]s representing invocations produced
  /// by calls to [identify] where each [String] is the id
  /// of the [Visitor]
  List<String> get identifyInvocations =>
      UnmodifiableListView(_identifyInvocations);

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
  bool identifyCalledWith(String visitorId) =>
      _identifyInvocations.contains(visitorId);

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
