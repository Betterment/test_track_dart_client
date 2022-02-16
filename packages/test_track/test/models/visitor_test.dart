import 'package:test/test.dart';
import 'package:test_track/src/models/models.dart';

void main() {
  group('Visitor', () {
    group('build', () {
      test('it returns a new Visitor with a randomly generated id and empty assignments', () {
        final subject = Visitor.build();
        final anotherVisitor = Visitor.build();
        final uuidV4Regexp = RegExp(
          '^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}\$',
          caseSensitive: false,
        );

        expect(subject.assignments, isEmpty);
        expect(subject.id, isNotEmpty);
        expect(uuidV4Regexp.hasMatch(subject.id), isTrue);
        expect(subject.id != anotherVisitor.id, isTrue);
      });
    });
  });
}
