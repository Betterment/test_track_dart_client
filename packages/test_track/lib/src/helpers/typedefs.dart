typedef AsyncValueGetter<T> = Future<T> Function();

typedef ValueSetter<T> = void Function(T value);

typedef VoidCallback = void Function();

typedef ValueTransformer<T, U> = U Function(T);
