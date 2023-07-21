import 'package:charlatan/charlatan.dart';
import 'package:sturdy_http/sturdy_http.dart';
import 'package:test/test.dart';
import 'package:test_track/src/domain/domain.dart';
import 'package:test_track/test_track.dart';
import 'package:test_track_test_support/test_track_test_support.dart';

import '../networking/fakes/fake_http_client.dart';

void main() {
  group('ReportAssignmentEvent', () {
    group('call(visitorId:, splitName:, context:)', () {
      late Charlatan charlatan;
      late SturdyHttp client;

      final assignmentEvent = AssignmentEvent(
        visitorId: VisitorFactory.build().id,
        splitName: 'foo_enabled',
        context: 'context',
      );

      late AssignmentEvent? assignmentEventFromRequest;
      late bool isIdempotent;

      setUp(() {
        charlatan = Charlatan()
          ..whenPost(
            '/api/v1/assignment_event',
            (request) {
              final data = request.body as Map<String, Object?>?;
              assignmentEventFromRequest =
                  data != null ? AssignmentEvent.fromJson(data) : null;
              isIdempotent =
                  request.requestOptions.extra['is_idempotent'] as bool;
              return CharlatanHttpResponse(statusCode: 204);
            },
          );
      });

      ReportAssignmentEvent buildSubject({
        TestTrackLogger? loggerOverride,
      }) {
        client = FakeSturdyHttp(charlatan);
        return ReportAssignmentEvent(
          client: client,
          logger: loggerOverride ?? FakeTestTrackLogger.withoutNetworkLogging(),
        );
      }

      test('it makes a POST request to the correct url with the correct body',
          () async {
        final subject = buildSubject();
        await subject.call(assignmentEvent);
        expect(assignmentEventFromRequest, assignmentEvent);
        expect(isIdempotent, isTrue);
      });

      group('when the api call fails', () {
        test('it does not throw', () async {
          charlatan.whenPost(
            '/api/v1/assignment_event',
            (request) => CharlatanHttpResponse(statusCode: 500),
          );

          final logger = FakeTestTrackLogger(shouldEnableNetworkLogging: true);

          final subject = buildSubject(
            loggerOverride: logger,
          );

          final result = subject.call(assignmentEvent);

          expectLater(result, completes);
        });
      });
    });
  });
}
