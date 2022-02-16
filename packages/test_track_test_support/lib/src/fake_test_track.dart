import 'package:test_track/test_track.dart';

typedef Ab = bool Function(String, String, String?);
typedef Vary = String Function(String, String, String);

/// {@template fake_test_track}
/// A fake [TestTrack] that offers sane default functionality
/// but allows for passing in behavior for the core functions
/// such as [Ab] and [Vary] operations.
/// {@endtemplate}
class FakeTestTrack implements TestTrack {
  /// Default behavior for the [ab] operation,
  /// which always returns `true`
  static bool defaultAb(
    String splitName,
    String context,
    String? trueVariant,
  ) {
    return true;
  }

  /// Default behavior for the [vary] operation,
  /// which always returns the [defaultVariant]
  static String defaultVary(
    String splitName,
    String defaultVariant,
    String context,
  ) {
    return defaultVariant;
  }

  /// {@macro fake_test_track}
  FakeTestTrack({
    Visitor? visitor,
    SplitRegistry? splitRegistry,
    Ab ab = defaultAb,
    Vary vary = defaultVary,
  })  : _visitor = visitor ?? Visitor.build(),
        _splitRegistry = splitRegistry ?? SplitRegistry.empty(),
        _ab = ab,
        _vary = vary;

  /// The [Visitor] currently being tracked, defaults
  /// to the result of [Visitor.build]
  Visitor _visitor;

  /// The [SplitRegistry] containing the [Split]s
  /// that [FakeTestTrack] is aware of.
  final SplitRegistry _splitRegistry;

  /// Logic to be invoked when an [ab] operation
  /// is requested
  final Ab _ab;

  /// Logic to be invoked when a [vary] operation
  /// is requested
  final Vary _vary;

  /// Simple tracking of authentication state
  var _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  @override
  SplitRegistry get splitRegistry => _splitRegistry;

  @override
  Visitor get visitor => _visitor;

  @override
  List<Assignment> get visitorAssignments => _visitor.assignments;

  @override
  bool ab({
    required String splitName,
    required String context,
    String? trueVariant,
  }) {
    return _ab(splitName, context, trueVariant);
  }

  @override
  String vary({
    required String splitName,
    required String defaultVariant,
    required String context,
  }) {
    return _vary(splitName, defaultVariant, context);
  }

  @override
  Future<void> login({
    required String identifierType,
    required String value,
  }) async {
    _isLoggedIn = true;
  }

  @override
  Future<void> logout() async {
    _visitor = Visitor.build();
    _isLoggedIn = false;
  }

  @override
  Future<void> createAssignmentOverrides({
    required List<AssignmentOverride> assignmentOverrides,
  }) async {
    _visitor = _visitor.copyWith(assignments: [
      ..._visitor.assignments,
      ...assignmentOverrides
          .map((e) => Assignment(
                splitName: e.splitName,
                variant: e.variant,
                context: e.context,
              ))
          .toList(),
    ]);
  }
}
