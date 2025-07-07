import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/image/rating.png"),
        SizedBox(width: 5),
        Text(
          rating.toString(),
          style: TextStyles.sf40016.copyWith(color: AppPalette.iosYellow),
        ),
      ],
    );
  }
}
