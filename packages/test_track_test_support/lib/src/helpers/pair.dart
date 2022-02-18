import 'package:freezed_annotation/freezed_annotation.dart';

@immutable

/// {@template pair}
/// A simple Pair implementation because that's
/// not a thing in the dart language
/// {@endtemplate}
class Pair<T1, T2> {
  /// The first element of the pair
  final T1 first;

  /// The second element of the pair
  final T2 second;

  /// {@macro pair}
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
