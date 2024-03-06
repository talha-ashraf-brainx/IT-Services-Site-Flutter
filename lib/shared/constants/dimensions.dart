import 'package:flutter/material.dart';

class Dimensions {
  static double height(context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double width(context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double size(context, fontSize) {
    if (context == null) return fontSize;
    final smallerDimension =
        height(context) < width(context) ? height(context) : width(context);
    return (smallerDimension / 100) * fontSize;
  }
}
