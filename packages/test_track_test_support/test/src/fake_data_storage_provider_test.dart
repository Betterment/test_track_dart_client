import 'package:test/test.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

void main() {
  group('FakeDataStorageProvider', () {
    late FakeDataStorageProvider subject;
    late bool onInitializeCalled;

    setUp(() {
      subject = FakeDataStorageProvider(
        onInitialize: () => onInitializeCalled = true,
      );
    });

    group('initialize', () {
      test('it invokes onInitialize if supplied', () async {
        await subject.initialize();
        expect(onInitializeCalled, isTrue);
      });
    });

    group('split registry', () {
      test('it saves the split registry in memory', () async {
        final splitRegistry = SplitRegistryFactory.build();

        expect(await subject.fetchSplitRegistry(), isNull);

        await subject.storeSplitRegistry(splitRegistry);

        final fetchedRegistry = await subject.fetchSplitRegistry();

        expect(fetchedRegistry, splitRegistry);
      });
    });

    group('visitor', () {
      test('it saves the visitor in memory', () async {
        final visitor = VisitorFactory.build();

        expect(await subject.fetchVisitor(), isNull);

        await subject.storeVisitor(visitor);

        final fetchedVisitor = await subject.fetchVisitor();

        expect(fetchedVisitor, visitor);
      });
    });
  });
}
