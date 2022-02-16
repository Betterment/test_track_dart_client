import 'package:dio/dio.dart';
import 'package:test_track/src/helpers/typedefs.dart';

/// A fake [ErrorInterceptorHandler] that will
/// notify the consumer when [next] is invoked
/// by passing along the [DioError]
class FakeErrorHandlerInterceptorHandler extends ErrorInterceptorHandler {
  final ValueSetter<DioError>? _onNextInvoked;

  FakeErrorHandlerInterceptorHandler({
    ValueSetter<DioError>? onNextInvoked,
  }) : _onNextInvoked = onNextInvoked;

  @override
  void next(DioError err) {
    _onNextInvoked?.call(err);
  }
}
