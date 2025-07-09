import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/specialists/presentation/widgets/rating_widget.dart';

class SpecialistsBody extends StatelessWidget {
  const SpecialistsBody({
    super.key,
    required this.image,
    required this.name,
    required this.subtitle,
    this.rating,
    this.isRating = false,
  });
  final String image;
  final String name;
  final String subtitle;
  final double? rating;
  final bool isRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: AppPalette.whitePrimary,
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(width: 7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 7),
            Text(name, softWrap: true, style: TextStyles.sf60016),
            SizedBox(height: 7),
            Text(
              subtitle,
              softWrap: true,
              style: TextStyles.sf50014.copyWith(color: AppPalette.black),
            ),
            SizedBox(height: 9),
            isRating ? RatingWidget(rating: rating!) : SizedBox(),
          ],
        ),
      ],
    );
  }
}
