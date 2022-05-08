import 'package:flutter/material.dart';
import 'package:github_api_dome/Model/GridItem.dart';
import 'package:github_api_dome/component/GridCategory.dart';
import 'package:github_api_dome/component/searchBar.dart';

class PageHomeFeed extends StatefulWidget {
  const PageHomeFeed({Key? key}) : super(key: key);

  @override
  State<PageHomeFeed> createState() => _PageHomeFeedState();
}

class _PageHomeFeedState extends State<PageHomeFeed> {
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
                      crossAxisCount: 2,childAspectRatio: 2.0)),
            ],
          ),
        ),
      ),
    );
  }
}
