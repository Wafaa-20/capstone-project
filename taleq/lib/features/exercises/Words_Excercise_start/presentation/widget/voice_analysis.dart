import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';

class VoiceAnalysis extends StatelessWidget {
  const VoiceAnalysis({super.key});
  final bool isRecord = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isRecord
            ? CustomIconButton(
                withContainer: true,
                icon: (Icons.mic),
                size: 68,
                onPressed: () {},
              )
            : CustomIconButton(
                withContainer: true,
                icon: (Icons.stop),
                size: 68,
                onPressed: () {
                  context.go('/navigation');
                },
              ),
      ],
    );
  }
}
