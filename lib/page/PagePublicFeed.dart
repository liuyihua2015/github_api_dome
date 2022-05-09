import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_api_dome/Model/Activity.dart';
import 'package:github_api_dome/component/CardEvent.dart';
import 'package:github_api_dome/net/GithubServices.dart';
class PagePublicFeed extends StatefulWidget {
  PagePublicFeed({Key? key}) : super(key: key);

  @override
  State<PagePublicFeed> createState() => _PagePublicFeedState();
}

class _PagePublicFeedState extends State<PagePublicFeed> {

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
        ?.listPublicEvents(_currentPage, 10)
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
  bool _onScrollEvent(ScrollNotification notification) {
    if (notification.metrics.extentAfter == 0 &&
        notification.metrics.pixels >=
            notification.metrics.maxScrollExtent * 0.8) {
      if (_loading) return false;
      setState(() {
        _loading = true;
      });
      loadNextPage();
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Public Events",),
      ),
      body:NotificationListener<ScrollNotification>(
        onNotification:_onScrollEvent,
        child: ListView.separated(itemBuilder: (context,index){
          if(index == _events.length){
            return const SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
            ),);
          }
          return CardEvent(_events[index]);
        }, separatorBuilder: (context,index){
          return const Divider();
        }, itemCount: _events.length + 1,),
      ),
    );
  }
}
