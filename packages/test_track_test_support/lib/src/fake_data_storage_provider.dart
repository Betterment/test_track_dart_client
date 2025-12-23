import 'package:test_track/test_track.dart';

/// {@template fake_data_storage_provider}
/// A fake implementation of [DataStorageProvider] that maintains
/// a [Visitor] and [SplitRegistry] in-memory.
///
/// Sometimes it's useful to cache a [Visitor] or [SplitRegistry]
/// prior to running a test, which can be done via the public
/// [storeVisitor] and [storeSplitRegistry] functions respectively.
/// {@endtemplate}
class FakeDataStorageProvider implements DataStorageProvider {
  final void Function()? _onInitialize;
  SplitRegistry? _splitRegistry;
  Visitor? _visitor;
  bool _isLoggedIn = false;

  /// {@macro fake_data_storage_provider}
  ///
  /// [onInitialize] can be provided if you wish to be notified
  /// when [TestTrack] attempts to initialize the [DataStorageProvider]
  FakeDataStorageProvider({void Function()? onInitialize})
    : _onInitialize = onInitialize;

  @override
  Future<SplitRegistry?> fetchSplitRegistry() async {
    return _splitRegistry;
  }

  @override
  Future<Visitor?> fetchVisitor() async {
    return _visitor;
  }

  @override
  Future<void> initialize() async {
    _onInitialize?.call();
  }

  @override
  Future<void> storeSplitRegistry(SplitRegistry splitRegistry) async {
    _splitRegistry = splitRegistry;
  }

  @override
  Future<void> storeVisitor(Visitor visitor) async {
    _visitor = visitor;
  }

  @override
  Future<void> storeLoginState(bool isLoggedIn) async {
    _isLoggedIn = isLoggedIn;
  }

  @override
  Future<bool> fetchLoginState() async {
    return _isLoggedIn;
  }
}
