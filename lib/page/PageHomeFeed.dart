import 'package:flutter/material.dart';
import 'package:github_api_dome/component/searchBar.dart';

class PageHomeFeed extends StatefulWidget {
  const PageHomeFeed({Key? key}) : super(key: key);

  @override
  State<PageHomeFeed> createState() => _PageHomeFeedState();
}

class _PageHomeFeedState extends State<PageHomeFeed> {
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
            ],
          ),
        ),
      ),
    );
  }
}
