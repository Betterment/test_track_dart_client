# TestTrack Dart Client

[![Build status](https://github.com/Betterment/test_track_dart_client/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/Betterment/test_track_dart_client/actions/workflows/ci.yml?query=branch%3Amain)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Betterment/test_track_dart_client/pulse)

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

### API

#### Vary

```dart
final variant = testTrack.vary({
    splitName,
    defaultVariant,
    context,
});
```

The `vary` method is used to perform a split. It takes 3 arguments.

- `splitName` -- The first argument is the name of the split. This will be a snake_case string, e.g. `"homepage_redesign_q1_2015"`.
- `defaultVariant` -- The default variant is used if the user is assigned to a variant that is not represented in the `variants` object. When this happens, Test Track will return the default variant and re-assign the user to the default variant. **You should not rely on this defaulting behavior, it is merely provided to ensure we don't break the customer experience.** You should instead make sure that you represent all variants of the split in your `variants` and if variants are added to the split on the backend, update your code to reflect the new variants. Because this defaulting behavior re-assigns the user to the `defaultVariant`, no data will be recorded for the variant that is not represented. This will impede our ability to collect meaningful data for the split.
- `context` -- is a string that the developer provides so that the test track server can record where an assignment was first created. If a call to `vary` is made in more than one place for a given split, you'll be able to see which codepath was hit first.

Here is an example of a 4-way split where `'variant_4'` is the default variant. Let's say `'variant_5'` was added to this split on the backend but this code did not change to reflect that new variant. Any users that Test Track assigns to `'variant_5'` will be re-assigned to `'variant_4'`.

#### Ab

```dart
final isFeatureGateEnabled = testTrack.ab({
    splitName,
    context,
    trueVariant,
});
```
The `ab` method is used exclusively for two-way splits and feature toggles. It takes 2 arguments.

- `split_name` -- The first argument is the name of the split. This will be a snake_case string, e.g. `"homepage_chat_bubble"`.
- `context` -- is a string that the developer provides so that the test track server can record where an assignment was first created. If a call to `ab` is made in more than one place for a given split, you'll be able to see which codepath was hit first.
- `trueVariant` -- an optional parameter that specifies which variant is the "true" variant and the other variant will be used as the default. Without the true variant, `ab` will assume that the variants for the split are named `'true'` and `'false'`.

#### `.logIn(identifier, value)`

The `logIn` method is used to ensure a consistent experience across devices. For instance, when a user logs in to your app on a new device, you should also log the user into Test Track in order to grab their existing split assignments instead of treating them like a new visitor. It takes 2 arguments.

- `identifier` -- The first argument is the name of the identifier. This will be a snake_case string, e.g. `"myapp_user_id"`.
- `value` -- The second argument is a primitive value, e.g. `12345`, `"abcd"`
