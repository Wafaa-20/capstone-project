// lib/success_page.dart
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  SuccessPageState createState() => SuccessPageState();
}

class SuccessPageState extends State<SuccessPage> {
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(
      duration: const Duration(seconds: 5),
    );
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  Path _drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(
        halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step),
      );
      path.lineTo(
        halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep),
      );
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/check.png"),
                  SizedBox(height: 24),
                  Text(
                    AppText.exrIsDone.tr(),
                    style: TextStyles.sf70018.copyWith(color: AppPalette.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: () {
                      context.customPop();
                    },
                    color: AppPalette.greenSuccessLight,
                    sideColor: AppPalette.greenSuccessLightTransparent,
                    height: 36,
                    width: 86,
                    child: Text(
                      AppText.next.tr(),
                      style: TextStyles.sf40016.copyWith(
                        color: AppPalette.greenSuccess,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // **Confetti Widget:**
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  Colors.red,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                  Colors.purple,
                  Colors.orangeAccent,
                ],
                createParticlePath: _drawStar,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                maxBlastForce: 100,
                minBlastForce: 80,
                gravity: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
