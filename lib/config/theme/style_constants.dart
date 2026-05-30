import 'package:flutter/material.dart';

class StyleConstants {
  static const Duration animationDuration = Duration(milliseconds: 220);
  static const double largeSpacing = 12;
  static const double defaultSpacing = 8;
  static const double smallSpacing = 3;
  static const double defaultBorderRadius = 12;
  static const double navigationBarBorderRadius = 25;
  static const double iconSize = 25;
  static const EdgeInsets pageDefaultPadding = EdgeInsets.fromLTRB(
    StyleConstants.defaultSpacing,
    0,
    StyleConstants.defaultSpacing,
    0,
  );
  static const appBarSize = Size(double.infinity, 60);
  static const popupMenuConstrains = BoxConstraints(
    maxHeight: 200,
    minHeight: 200,
    maxWidth: 200,
  );
  static const double maxTodoListCardSize = 300;
  static const double todoListDraggedCardSize = 200;
}
