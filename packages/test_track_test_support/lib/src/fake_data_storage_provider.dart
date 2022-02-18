import 'package:test_track/test_track.dart';

class FakeDataStorageProvider implements DataStorageProvider {
  final void Function()? _onInitialize;
  SplitRegistry? _splitRegistry;
  Visitor? _visitor;

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
}
