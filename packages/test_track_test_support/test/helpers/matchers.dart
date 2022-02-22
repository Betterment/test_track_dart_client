import 'package:test/expect.dart';

/// Returns a matcher that matches if the match argument *only*
/// contains the expected items
Matcher onlyContains<T>(List<T> expected) {
  return _OnlyContains(expected);
}

class _OnlyContains<T> extends Matcher {
  final List<T> _expected;

  _OnlyContains(this._expected);

  @override
  Description describe(Description description) =>
      description.add('only ').addDescriptionOf(_expected);

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    if (item is List<T>) {
      final items = [...item];
      if (items.length != _expected.length) {
        final diff = (items.length - _expected.length).abs();
        mismatchDescription.add('differed in length by $diff items');
      }
      return super.describeMismatch(
        item,
        mismatchDescription,
        matchState,
        verbose,
      );
    } else {
      return mismatchDescription.add('was not a list');
    }
  }

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is List<T>) {
      final items = [...item];
      if (items.length != _expected.length) {
        return false;
      }
      items.removeWhere((i) => _expected.contains(i));
      return items.isEmpty;
    } else {
      return false;
    }
  }
}
