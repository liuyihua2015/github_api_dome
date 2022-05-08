import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_api_dome/Model/Activity.dart';
import 'package:github_api_dome/Model/GridItem.dart';
import 'package:github_api_dome/component/CardEvent.dart';
import 'package:github_api_dome/component/GridCategory.dart';
import 'package:github_api_dome/component/searchBar.dart';
import 'package:github_api_dome/net/GithubServices.dart';

class PageHomeFeed extends StatefulWidget {
  const PageHomeFeed({Key? key}) : super(key: key);

  @override
  State<PageHomeFeed> createState() => _PageHomeFeedState();
}

class _PageHomeFeedState extends State<PageHomeFeed> {
  List<Event> _events = [];
  bool _loading = false;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() {
    if (kDebugMode) {
      print("拉取第$_currentPage页数据");
    }
    GithubServices.activityService
        ?.listPersonalEvents("liuyihua2015", _currentPage, 30)
        .then((event) => {
              setState(() {
                if (kDebugMode) {
                  print("第$_currentPage页数据加载完成");
                }
                _events.addAll(event); // 添加到数组中
                _currentPage++;
                _loading = false;
              })
            });
  }

  List<Widget> createGrid() {
    List<GridItem> grids = [
      GridItem(
          "GitHub Trends", Icons.trending_up, Colors.orange, (context) => null),
      GridItem("Public Events", Icons.timeline_outlined, Colors.green,
          (context) => null),
      GridItem("Users", Icons.people, Colors.pink, (context) => null),
      GridItem("Projects", Icons.work, Colors.blue, (context) => null),
    ];
    return grids.map((grid) => GridCategory(grid)).toList();
  }

  bool _onScrollEvent(ScrollNotification notification) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: _onScrollEvent,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                  pinned: true, delegate: searchBarDelegate()),
              SliverGrid(
                  delegate: SliverChildListDelegate(createGrid()),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2.0)),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                final itemIndex = index ~/ 2;
                if (index.isEven) {
                  return CardEvent(_events[itemIndex]);
                }
                return const Divider();
              }, childCount: max(0, _events.length * 2 - 1))),
            ],
          ),
        ),
      ),
    );
  }
}
