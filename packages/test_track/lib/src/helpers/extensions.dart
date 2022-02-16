import 'package:test_track/src/helpers/typedefs.dart';

extension ObjectExtensions<I extends Object?> on I {
  T? map<T>(ValueTransformer<I, T> transform) {
    if (this == null) return null;
    return transform(this);
  }
}
