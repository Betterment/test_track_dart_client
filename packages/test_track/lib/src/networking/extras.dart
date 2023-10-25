// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:sturdy_http/sturdy_http.dart';

/// An extra used only within the SDK that indicates when a request is idempotent
/// and can therefore be retried without risk of producing incorrect state.
const isIdempotentOptionsKey = 'is_idempotent';

/// A convenience class for producing a [GetRequest] that contains the
/// [isIdempotentOptionsKey]
class IdempotentGetRequest extends GetRequest {
  IdempotentGetRequest(super.path)
      : super(
          options: Options(
            extra: {
              isIdempotentOptionsKey: true,
            },
          ),
        );
}

/// A convenience class for producing a [PostRequest] that contains the
/// [isIdempotentOptionsKey]
class IdempotentPostRequest extends PostRequest {
  IdempotentPostRequest(
    super.path, {
    required super.data,
  }) : super(
          options: Options(
            extra: {
              isIdempotentOptionsKey: true,
            },
          ),
        );
}
