import 'package:charlatan/charlatan.dart';
import 'package:sturdy_http/sturdy_http.dart';

class FakeSturdyHttp extends SturdyHttp {
  FakeSturdyHttp(
    Charlatan charlatan,
  ) : super(
          baseUrl: 'http://localhost',
          customAdapter: charlatan.toFakeHttpClientAdapter(),
          inferContentType: false,
        );
}
