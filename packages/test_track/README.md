# TestTrack Dart Client

This is the dart client library for the [TestTrack](https://github.com/Betterment/test_track) system.

It provides client-side split-testing and feature-toggling through a simple API.

This library intends to obscure the details of assignment and visitor session management, allowing you to focus entirely on the experience a visitor should have when they have been assigned a variant.

If you're looking to do server-side assignment and you're using Rails, then check out our [Rails client](https://github.com/Betterment/test_track_rails_client).

## Configuration

To use the client you must call `TestTrack.initialize()`.

```dart
/// The returned TestTrack instance is the client;
/// you'll only want to initialize it once during
/// your application lifecycle.

final testTrack = await TestTrack.initialize(
    baseUrl: 'https://example.com/',
    appVersionBuild: config.appVersionBuild,
    dataStorageProvider: ExampleDataStorageProvider(),
    analyticsProvider: ExampleAnalyticsProvider(),
    logger: const ExampleTestTrackLogger(),
);
```

Initializing the TestTrack client will automatically fetch the existing cached visitor's configuration if it exists. If a cached visitor does not exist, an anonymous visitor will be generated and stored, and the latest split configurations will be fetched.

_Read more about the `dataStorageProvider` and `analyticsProvider` arguments [below](#DataStorageProvider])._

### API

#### Vary

```dart
final variant = testTrack.vary(
    splitName: 'homepage_redesign_q1_2022_experiment',
    defaultVariant: 'control',
    context: 'home',
);
```

The `vary` method is used to perform a split. It takes 3 arguments.

- `splitName` -- The first argument is the name of the split. This will be a snake_case string, e.g. `"homepage_redesign_q1_2022_experiment"`.
- `defaultVariant` -- The default variant is used if the user is assigned to a variant that is not represented in the `variants` object. When this happens, Test Track will return the default variant and re-assign the user to the default variant. **You should not rely on this defaulting behavior, it is merely provided to ensure we don't break the customer experience.** You should instead make sure that you represent all variants of the split in your `variants` and if variants are added to the split on the backend, update your code to reflect the new variants. Because this defaulting behavior re-assigns the user to the `defaultVariant`, no data will be recorded for the variant that is not represented. This will impede our ability to collect meaningful data for the split.
- `context` -- is a string that the developer provides so that the test track server can record where an assignment was first created. If a call to `vary` is made in more than one place for a given split, you'll be able to see which codepath was hit first.

#### Ab

```dart
final isFeatureGateEnabled = testTrack.ab(
    splitName: 'homepage_chat_bubble_enabled',
    context: 'home',
    trueVariant: 'specialTrueVariant',
);
```
The `ab` method is used exclusively for two-way splits and feature toggles. It takes 2 arguments.

- `splitName` -- The first argument is the name of the split. This will be a snake_case string, e.g. `"homepage_chat_bubble_enabled"`.
- `context` -- is a string that the developer provides so that the test track server can record where an assignment was first created. If a call to `ab` is made in more than one place for a given split, you'll be able to see which codepath was hit first.
- `trueVariant` -- an optional parameter that specifies which variant is the "true" variant and the other variant will be used as the default. Without the true variant, `ab` will assume that the variants for the split are named `'true'` and `'false'`.

#### `.logIn(identifier, value)`

The `logIn` method is used to ensure a consistent experience across devices. For instance, when a user logs in to your app on a new device, you should also log the user into Test Track in order to grab their existing split assignments instead of treating them like a new visitor. It takes 2 arguments.

- `identifier` -- The first argument is the name of the identifier. This will be a snake_case string, e.g. `"myapp_user_id"`.
- `value` -- The second argument is a primitive value, e.g. `12345`, `"abcd"`

### DataStorageProvider

The [`DataStorageProvider`](lib/src/persistence/data_storage_provider.dart) is a required argument when instantiating `TestTrack`. The client will use your implementation to store the `Visitor` and their associated `SplitRegistry`. It will attempt to use these cached values when initialized in the future, and update them as the `Visitor` and `SplitRegistry` change.

### AnalyticsProvider

The [`AnalyticsProvider`](lib/src/analytics/analytics_provider.dart) is a required argument when instantiating `TestTrack`.

#### `identify`

The client will notify you via `identify` with the id of the current `Visitor` so that you can associate them with any analytics tooling and more accurately track the user's journey/experience while using your application. **Important:** Currently `TestTrack` will invoke `notify` both before _and_ after it is certain that the current `Visitor` id is the canonical one. In other words, you may receive more than one invocation of `identify` with different `visitorId`s for the same user. If your tooling supports this, everything should work fine. If, however, your tooling requires only associating a user with a single canonical id, you may consider holding off on integrating `TestTrack` with that tool. This is something we are currently working on mitigating, and in the future hope to add a function to this contract that will notify you of the anonymous visitor id and _only_ invoke `identify` once we know we have the user's canonical id.

#### `trackAssignment`

The client will notify you via `trackAssignment` when an assignment has been created for the current `Visitor`. This happens when either `ab` or `vary` is invoked and the current `Visitor` has not yet been assigned to the calculated variant.
