import 'package:github_api_dome/net/GitHub.dart';

abstract class Service {
  final GitHub gitHub;
  const Service(this.gitHub);
}