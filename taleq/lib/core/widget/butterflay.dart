import 'package:flutter/material.dart';

class ButterflyWidget extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double angle;
  final double width;
  final double height;
  final String imagePath;

  const ButterflyWidget({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.angle = 0,
    this.width = 100,
    this.height = 100,
    this.imagePath = 'assets/image/butterfly.png',
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Transform.rotate(
        angle: angle,
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
