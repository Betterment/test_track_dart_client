import 'package:test_track/test_track.dart';

/// A function representing the invocation of an
/// `ab` where the first parameter is the name of
/// the [Split], the second parameter is the context
/// of the call site performing the `ab`, and the
/// third parameter is the nullable name of the
///  default [Variant]
typedef Ab = bool Function(String, String, String?);

/// A function representing the invocation of a
/// `vary` where the first parameter is the name of
/// the [Split], the second parameter is the name of the
/// default [Variant] and the third parameter is the
/// context of the call site performing the `vary`
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

  Visitor _visitor;

  final SplitRegistry _splitRegistry;

  final Ab _ab;

  final Vary _vary;

  var _isLoggedIn = false;

  /// Returns true if [login] has been invoked
  /// but [logout] has not been invoked
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
