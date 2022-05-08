import 'package:flutter/material.dart';

class GridItem {
  String? title;
  IconData? icon;
  MaterialColor? color;
  Function(BuildContext context) getPage;
  GridItem(
    this.title,
    this.icon,
    this.color,
    this.getPage,
  );
}
