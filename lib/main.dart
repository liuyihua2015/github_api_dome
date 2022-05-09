import 'package:flutter/material.dart';
import 'package:github_api_dome/net/GitHub.dart';
import 'package:github_api_dome/net/GithubServices.dart';
import 'package:github_api_dome/page/PageHomeFeed.dart';

void main() {
  final github = GitHub("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");
  GithubServices.init(github);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "技术头条",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:PageHomeFeed(),
    );
  }
}
