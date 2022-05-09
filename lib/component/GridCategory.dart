import 'package:flutter/material.dart';
import 'package:github_api_dome/Model/GridItem.dart';
import 'package:github_api_dome/page/PagePublicFeed.dart';

class GridCategory extends StatelessWidget {
  final GridItem _gridItem;
  const GridCategory(this._gridItem, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => _gridItem.getPage(context))),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _gridItem.icon,
              color: _gridItem.color,
              size: 36,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              _gridItem.title!,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }
}
