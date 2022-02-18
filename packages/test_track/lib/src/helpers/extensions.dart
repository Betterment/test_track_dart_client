import 'package:test_track/src/helpers/typedefs.dart';

// ignore: public_member_api_docs
extension ObjectExtensions<I extends Object?> on I {
  /// Maps the nullable receiver [Object] to a nullable
  /// [T] according to the supplied [ValueTransformer]
  T? map<T>(ValueTransformer<I, T> transform) {
    if (this == null) return null;
    return transform(this);
  }
}
