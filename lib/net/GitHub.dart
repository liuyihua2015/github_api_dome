import 'package:http/http.dart' as http;

const API = "https://api.github.com";
const V3_API_MINE_TYPE = "application/vnd.github.v3+json";

class GitHub {
  final String token;
  final http.Client client = http.Client();

  GitHub(this.token);

  Future<http.Response> request(String method, String path,
      Map<String, dynamic> params, dynamic body) async {
    var headers = {"Authorization": "token $token"};
    var queryString = "";
    if (params != null) {
      queryString = _buildQueryString(params);
    }
    final url = API + path + queryString;
    final request = http.Request(method, Uri.parse(url));
    request.headers.addAll(headers);
    if (body != null) {
      if (body is List<int>) {
        request.bodyBytes = body;
      } else {
        request.body = body.toString();
      }
    }
    final StreamedResponse = await client.send(request);
    final response = await http.Response.fromStream(StreamedResponse);
    return response;
  }

  String _buildQueryString(Map<String, dynamic> params) {
    final queryString = StringBuffer();
    if (params.isNotEmpty &&
        !params.values.every((element) => element == null)) {
      queryString.write("?");
    }
    var i = 0;
    for (var key in params.keys) {
      i++;
      if (params[key] == null) {
        continue;
      }

      queryString.write("$key=${Uri.encodeComponent(params[key].toString())}");
      if (i != params.keys.length) {
        queryString.write("&");
      }
    }
    return queryString.toString();
  }

  void dispose() {
    client.close();
  }
}
