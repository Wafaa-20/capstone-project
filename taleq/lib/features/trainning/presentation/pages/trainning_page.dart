import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/trainning/data/models/card_training_model.dart';

class TrainningPage extends StatelessWidget {
  const TrainningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trainning')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: cardData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 110,
            mainAxisSpacing: 24,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (BuildContext context, int index) {
            final card = cardData[index];
            final isSvg = card.image.toLowerCase().endsWith('.svg');

            return Container(
              decoration: BoxDecoration(
                color: card.background,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: card.imageAligment,
                    child: isSvg
                        ? SvgPicture.asset(
                            card.image,
                            height: card.imageHeight,
                            width: card.imageWidth,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            card.image,
                            height: card.imageHeight,
                            width: card.imageWidth,
                            fit: BoxFit.fill,
                          ),
                  ),
                  Center(
                    child: Text(
                      card.title,
                      style: TextStyles.sf70016.copyWith(
                        color: AppPalette.whiteLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
