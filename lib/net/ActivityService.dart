import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:github_api_dome/Model/Activity.dart';
import 'package:github_api_dome/net/GitHub.dart';
import 'package:github_api_dome/net/Service.dart';
import 'package:http/http.dart' as http;

class ActivityService extends Service {
  ActivityService(GitHub gitHub) : super(gitHub);

  get body => null;

  Future<List<Event>> listPublicEvents(int page, int perPage) async {
    final params = {"page": page, "per_page": perPage};
    http.Response response =
        await gitHub.request('GET', "/events", params: params);
    final json = jsonDecode(response.body) as List;
    return json.map((e) => Event.fromJson(e)).toList();
  }

  Future<List<Event>> listPersonalEvents(
      String login, int page, int perPage) async {
    http.Response response = await gitHub.request(
        'GET', "/users/$login/received_events/public",
        params: {"page": page, "per_page": perPage});
    if (kDebugMode) {
      print(response.body);
    }
    final json = jsonDecode(response.body) as List;
    return json.map((e) => Event.fromJson(e)).toList();
  }
}
