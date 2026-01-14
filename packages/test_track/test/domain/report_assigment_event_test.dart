import 'package:charlatan/charlatan.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../networking/fakes/fake_http_client.dart';

void main() {
  group('ReportAssignmentEvent', () {
    group('call(visitorId:, splitName:, context:)', () {
      final assignmentEvent = AssignmentEvent(
        visitorId: VisitorFactory.build().id,
        splitName: 'foo_enabled',
        context: 'context',
      );

      ReportAssignmentEvent buildSubject({
        TestTrackLogger? loggerOverride,
        Charlatan? charlatan,
      }) {
        charlatan ??= Charlatan();
        final client = FakeSturdyHttp(charlatan);
        return ReportAssignmentEvent(
          client: client,
          logger: loggerOverride ?? FakeTestTrackLogger.withoutNetworkLogging(),
        );
      }

      test(
        'it makes a POST request to the correct url with the correct body',
        () async {
          late final AssignmentEvent? assignmentEventFromRequest;
          late final bool isIdempotent;
          final charlatan =
              Charlatan()..whenPost('/api/v1/assignment_event', (request) {
                final data = request.body as Map<String, Object?>?;
                print('Setting assignmentEventFromRequest with data: $data');
                assignmentEventFromRequest =
                    data != null ? AssignmentEventMapper.fromMap(data) : null;
                print(
                  'assignmentEventFromRequest set to: $assignmentEventFromRequest',
                );
                isIdempotent =
                    request.requestOptions.extra['is_idempotent'] as bool;
                return CharlatanHttpResponse(statusCode: 204);
              });
          final subject = buildSubject(charlatan: charlatan);
          await subject.call(assignmentEvent);
          expect(assignmentEventFromRequest, assignmentEvent);
          expect(isIdempotent, isTrue);
        },
      );

      group('when the api call fails', () {
        test('it does not throw', () async {
          final charlatan =
              Charlatan()..whenPost('/api/v1/assignment_event', (request) {
                return CharlatanHttpResponse(statusCode: 500);
              });

          final logger = FakeTestTrackLogger(shouldEnableNetworkLogging: true);

          final subject = buildSubject(
            loggerOverride: logger,
            charlatan: charlatan,
          );

          final result = subject.call(assignmentEvent);

          expectLater(result, completes);
        });
      });
    });
  });
}
