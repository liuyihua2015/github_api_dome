import 'package:flutter/material.dart';
import 'package:github_api_dome/net/GitHub.dart';
import 'package:github_api_dome/net/GithubServices.dart';

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
      ),
      home:Container(),
    );
  }
}
