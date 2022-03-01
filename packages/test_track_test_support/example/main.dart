import 'package:test/test.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  test('FakeTestTrack allows you to configure deterministic behavior', () {
    final fakeTestTrack = FakeTestTrack(
      visitor: VisitorFactory.build().withId('abc123'),
      ab: (splitName, context, trueVariant) => splitName == 'test_enabled',
      vary: (splitName, defaultVariant, context) =>
          splitName == 'test_experiment' ? 'treatment' : 'control',
    );

    expect(fakeTestTrack.visitor.id, 'abc123');
    expect(
      fakeTestTrack.ab(splitName: 'test_enabled', context: 'whatever'),
      true,
    );
    expect(
      fakeTestTrack.ab(splitName: 'other_enabled', context: 'whatever'),
      false,
    );
    expect(
      fakeTestTrack.vary(
        splitName: 'test_experiment',
        defaultVariant: 'control',
        context: 'whatever',
      ),
      'treatment',
    );
    expect(
      fakeTestTrack.vary(
        splitName: 'other_experiment',
        defaultVariant: 'control',
        context: 'whatever',
      ),
      'control',
    );
  });
}
