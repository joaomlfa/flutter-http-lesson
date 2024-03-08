import 'package:http/http.dart';

class HttpClientBase {
  final Client client;
  final String token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmltYXJ5c2lkIjoiMSIsIm5hbWVpZCI6IjQwMTk5NTUxMDAwMTQwIiwibmJmIjoxNjU5MDI3NzIyLCJleHAiOjE4OTU4NTAxMjIsImlhdCI6MTY1OTAyNzcyMn0.nIsczK1Y4PASufXzTGzlvPosoedWMliiuQF0aZxX5nQ';

  HttpClientBase({required this.client});

  Future<Response> get({required String uri}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    var response = client.get(Uri.parse(uri), headers: headers);
    return response;
  }

  Future<Response> post(
      {required String uri, Map<String, dynamic>? body}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = client.post(
      Uri.parse(uri),
      headers: headers,
      body: body,
    );
    return response;
  }
}
