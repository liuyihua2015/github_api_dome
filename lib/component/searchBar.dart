import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  State<searchBar> createState() => _searchBarState();
}

// ignore: camel_case_types
class _searchBarState extends State<searchBar> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 40,
        child: CupertinoTextField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          controller: _controller,
          placeholder: 'Search',
          prefix: const Padding(
            padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          suffix: IconButton(
            icon: const Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
            onPressed: () {
                _controller.clear();
            },
          ),
          suffixMode: OverlayVisibilityMode.editing,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class searchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return const searchBar();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 60;

  @override
  // TODO: implement minExtent
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
