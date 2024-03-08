import 'package:dio/dio.dart';

class HttpClientBaseDio {
  final Dio http;
  final String token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmltYXJ5c2lkIjoiMSIsIm5hbWVpZCI6IjQwMTk5NTUxMDAwMTQwIiwibmJmIjoxNjU5MDI3NzIyLCJleHAiOjE4OTU4NTAxMjIsImlhdCI6MTY1OTAyNzcyMn0.nIsczK1Y4PASufXzTGzlvPosoedWMliiuQF0aZxX5nQ';
  HttpClientBaseDio({required this.http});

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return http.get(
      uri,
      queryParameters: queryParameters,
      options: options ?? getOptions(),
    );
  }

  Options getOptions() {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );
  }
}
