# TestTrack Test Support

This is the testing support package intended to facilitate easy integration testing with the [TestTrack dart client][test_track_dart_client].

### FakeTestTrack

The most useful utility offered by this package is [`FakeTestTrack`][fake_test_track]. This is a `TestTrack` instance that has the same API as the production implementation, but doesn't talk to your backend. Instead, it supports configuring the desired split configurations so you can test how your application responds.

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

This package also providers [factories][factories] for use in tests.

```dart
final visitor = VisitorFactory.build().withAssignments(...);
final splitRegistry = SplitRegistryFactory.build();

final testTrack = FakeTestTrack(
    visitor: visitor,
    splitRegistry: splitRegistry,
);
```

[test_track_dart_client]: https://github.com/Betterment/test_track_dart_client/tree/main/packages/test_track
[fake_test_track]: https://github.com/Betterment/test_track_dart_client/blob/main/packages/test_track_test_support/lib/src/fake_test_track.dart
[factories]: https://github.com/Betterment/test_track_dart_client/tree/main/packages/test_track_test_support/lib/src/factories
