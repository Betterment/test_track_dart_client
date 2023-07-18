// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:sturdy_http/sturdy_http.dart';

const isIdempotentOptionsKey = 'is_idempotent';

class IdempotentGetRequest extends GetRequest {
  IdempotentGetRequest(String path)
      : super(
          path,
          options: Options(
            extra: {
              isIdempotentOptionsKey: true,
            },
          ),
        );
}

class IdempotentPostRequest extends PostRequest {
  IdempotentPostRequest(
    String path, {
    required NetworkRequestBody data,
  }) : super(
          path,
          data: data,
          options: Options(
            extra: {
              isIdempotentOptionsKey: true,
            },
          ),
        );
}
