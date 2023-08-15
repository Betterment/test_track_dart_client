import 'package:dio/dio.dart';
import 'package:test_track/src/helpers/typedefs.dart';

/// A fake [ErrorInterceptorHandler] that will
/// notify the consumer when [next] is invoked
/// by passing along the [DioException]
class FakeErrorInterceptorHandler extends ErrorInterceptorHandler {
  final ValueSetter<DioException>? _onNextInvoked;
  final ValueSetter<Response<dynamic>>? _onResolveInvoked;

  FakeErrorInterceptorHandler({
    ValueSetter<DioException>? onNextInvoked,
    ValueSetter<Response<dynamic>>? onResolveInvoked,
  })  : _onNextInvoked = onNextInvoked,
        _onResolveInvoked = onResolveInvoked;

  @override
  void next(DioException err) {
    _onNextInvoked?.call(err);
  }

  @override
  void resolve(Response<dynamic> response) {
    _onResolveInvoked?.call(response);
  }
}
