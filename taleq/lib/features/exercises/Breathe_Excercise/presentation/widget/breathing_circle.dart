// lib/breathing_circle.dart
import 'package:flutter/material.dart';

class BreathingCircle extends StatelessWidget {
  final double scaleValue;
  final double opacityValue;

  const BreathingCircle({
    super.key,
    required this.scaleValue,
    required this.opacityValue,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: scaleValue * 1.5,
            child: Opacity(
              opacity: opacityValue * 0.6,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.4),
                ),
              ),
            ),
          ),
          Transform.scale(
            scale: scaleValue * 1.2,
            child: Opacity(
              opacity: opacityValue * 0.8,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.6),
                ),
              ),
            ),
          ),

          Transform.scale(
            scale: scaleValue,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
