import 'package:flutter/material.dart';

extension Screen on BuildContext {
  double getWidth() {
    return MediaQuery.of(this).size.width;
  }

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }

  double getSafeHeight() {
    return AppBar().preferredSize.height;
  }

  double getEqualedWidthHeight(double size) {
    final width = MediaQuery.of(this).size.width;
    final height = MediaQuery.of(this).size.height;

    final ratio = (width < height) ? width / height : height / width;
    final squareSize = ratio * size;

    return squareSize;
  }
}
