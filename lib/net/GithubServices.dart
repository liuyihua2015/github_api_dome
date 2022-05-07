import 'package:github_api_dome/net/ActivityService.dart';
import 'package:github_api_dome/net/GitHub.dart';

class GithubServices {
  static GitHub? _gitHub;
  static ActivityService? activityService;

  static void init(GitHub gitHub) {
    _gitHub = gitHub;
    activityService = ActivityService(_gitHub!);
  }
}