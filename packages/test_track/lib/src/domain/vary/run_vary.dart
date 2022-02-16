import 'package:collection/collection.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/test_track.dart';

/// {@template run_vary}
///
/// Determines the [Variant] of the [Split] that the provided
/// [Visitor] should be placed within.
///
/// If this has already been executed for the same [Visitor]
/// and [Split], will return the existing assigned [Variant].
///
/// {@endtemplate}
class RunVary {
  final CalculateVariant _calculateVariant;
  final AnalyticsProvider _analyticsProvider;
  final ReportAssignmentEvent _reportAssignmentEvent;
  final DataStorageProvider _dataStorageProvider;

  RunVary({
    required CalculateVariant calculateVariant,
    required AnalyticsProvider analyticsProvider,
    required ReportAssignmentEvent reportAssignmentEvent,
    required DataStorageProvider dataStorageProvider,
  })  : _calculateVariant = calculateVariant,
        _analyticsProvider = analyticsProvider,
        _reportAssignmentEvent = reportAssignmentEvent,
        _dataStorageProvider = dataStorageProvider;

  RunVaryResult call({
    required Visitor visitor,
    required Split split,
    required String defaultVariant,
    required String context,
  }) {
    Assignment? checkForExistingAssignments() {
      return visitor.assignments.firstWhereOrNull(
        (a) => a.splitName == split.name,
      );
    }

    var assignment = checkForExistingAssignments();

    if (assignment == null) {
      final variant = _calculateVariant(split: split, visitorId: visitor.id);
      assignment = Assignment.build(
        splitName: split.name,
        variant: variant.name,
        context: context,
      );
      if (!assignment.isFeatureGate) {
        // We don't need to await the non-critical
        // processes of tracking/reporting assignments
        _analyticsProvider.trackAssignment(
          visitorId: visitor.id,
          assignment: assignment,
        );
        final assignmentEvent = AssignmentEvent(
          visitorId: visitor.id,
          splitName: assignment.splitName,
          context: assignment.context,
        );
        _reportAssignmentEvent(assignmentEvent);
      }
    }

    // If for some reason the visitor was previously assigned
    // to a variant that no longer exists, return the default
    // variant
    final resultingVariantName = split.variants
            .singleWhereOrNull(
              (v) => v.name == assignment!.variant,
            )
            ?.name ??
        defaultVariant;

    // Ensure we're returning the correct updated assignments
    // by removing any previous assignment and replacing it
    // with the up-to-date one
    final visitorAssignments = [...visitor.assignments]
      ..removeWhere((a) => a.splitName == split.name)
      ..add(
        Assignment(
          splitName: split.name,
          variant: resultingVariantName,
          context: context,
        ),
      );

    final updatedVisitor = visitor.copyWith(
      assignments: visitorAssignments,
    );

    _dataStorageProvider.storeVisitor(updatedVisitor);

    return RunVaryResult(
      resultingVariantName,
      updatedVisitor,
    );
  }
}
