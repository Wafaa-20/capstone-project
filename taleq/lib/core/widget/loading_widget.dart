import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taleq/core/theme/app_palette.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whitePrimary,
      body: Center(
        child: Lottie.asset(
          'assets/json/6McAS3f5rb (8).json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
