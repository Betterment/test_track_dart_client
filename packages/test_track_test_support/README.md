# TestTrack Test Support

This is the testing support package intended to facilitate easy integration testing with the [TestTrack dart client](../test_track/).

### FakeTestTrack

The most useful utility offered by this package is [`FakeTestTrack`](lib/src/fake_test_track.dart). This is a `TestTrack` instance that has the same API as the production implementation, but doesn't talk to your backend. Instead, it supports configuring the desired split configurations so you can test how your application responds.

```dart
/// Creates a TestTrack instance where
/// all Abs return true
final testTrack = FakeTestTrack(
    ab: (_, __, ___) => true;
);

/// Creates a TestTrack instance where
/// all Varys return true
final testTrack = FakeTestTrack(
    vary: (_, __, ___) => true;
);
```

If you don't want to specify how the `FakeTestTrack` should respond, you can rely on its sane defaults.


### Factories

This package also providers [factories](lib/src/factories/) for use in tests.

```dart
final visitor = VisitorFactory.build().withAssignments(...);
final splitRegistry = SplitRegistryFactory.build();

final testTrack = FakeTestTrack(
    visitor: visitor,
    splitRegistry: splitRegistry,
);
```