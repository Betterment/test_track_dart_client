import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Pair<T1, T2> {
  final T1 first;
  final T2 second;
  const Pair(this.first, this.second);

  @override
  bool operator ==(final Object other) {
    return other is Pair<T1, T2> &&
        first == other.first &&
        second == other.second;
  }

  @override
  int get hashCode => Object.hash(first.hashCode, second.hashCode);
}
