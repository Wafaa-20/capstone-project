import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/theme/app_palette.dart';

class PlanDetailsModel {
  final String title;
  final String description;
  final String image;
  final Color color;
  final double width;
  final double height;
  final String route;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  PlanDetailsModel({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
    required this.width,
    required this.height,
    required this.route,
    this.top,
    this.left,
    this.bottom,
    this.right,
  });
}

List<PlanDetailsModel> planDetails = [
  PlanDetailsModel(
    title: AppText.introTitle.tr(),
    description: '',
    image: "assets/icon/exrRocket.svg",
    color: AppPalette.bluePrimary,
    width: 127,
    height: 127,
    top: -29.6,
    left: 112.3,
    route: '/srartexercise',
  ),
  PlanDetailsModel(
    title: AppText.exercise1Title.tr(),
    description: AppText.exercise1Description.tr(),
    image: 'assets/icon/Group 40949.svg',
    color: AppPalette.iosBlue,
    width: 442,
    height: 442,
    top: 12.6,
    left: -66,
    route: '/breathing',
  ),
  PlanDetailsModel(
    title: AppText.exercise2Title.tr(),
    description: AppText.exercise2Description.tr(),
    image: 'assets/icon/Vector (1).svg',
    color: AppPalette.iosOrange,
    width: 71.56,
    height: 108.89,
    bottom: -10,
    right: -5,
    route: '/srartwords',
  ),
  PlanDetailsModel(
    title: AppText.conclusionTitle.tr(),
    description: '',
    image: 'assets/icon/Vector.svg',
    color: AppPalette.bluePrimary,
    width: 170.2,
    height: 169.47,
    top: 40.3,
    left: 97.3,
    route: '/payment',
  ),
];
