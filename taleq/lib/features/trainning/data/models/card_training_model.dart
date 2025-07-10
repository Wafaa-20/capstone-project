
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CardTrainingModel {
  final String image;
  final String title;
  final String route;
  final Color background;
  final double imageWidth;
  final double imageHeight;
  // final double containerWidth;
  // final double containerHeight;
  final Alignment imageAligment;

  CardTrainingModel({
    required this.imageAligment,
    // required this.containerWidth,
    // required this.containerHeight,
    required this.imageWidth,
    required this.imageHeight,
    required this.background,
    required this.image,
    required this.title,
    required this.route,
  });
}

List<CardTrainingModel> cardData = [
  CardTrainingModel(
    background: AppPalette.iosYellow,
    image: "assets/image/green sound wave.png",
    title: AppText.control.tr(),
    route: '',
    imageWidth: 170,
    imageHeight: 80,
    // containerWidth: 175,
    // containerHeight: 100,
    imageAligment: Alignment.bottomCenter,
  ),
  CardTrainingModel(
    background: AppPalette.iosBlue,
    image: "assets/icon/Group 40952.svg",
    title: AppText.breath.tr(),
    route: '',
    imageWidth: 700,
    imageHeight: 90,
    // containerWidth: 175,
    // containerHeight: 100,
    imageAligment: Alignment.bottomCenter,
  ),

  CardTrainingModel(
    background: AppPalette.iosOrange,
    image: "assets/icon/mictrain.svg",
    title: AppText.talk.tr(),
    route: '',
    imageWidth: 80,
    imageHeight: 100,
    // containerWidth: 175,
    // containerHeight: 100,
    imageAligment: Alignment.centerRight,
  ),
  CardTrainingModel(
    background: AppPalette.greenSuccess,
    image: "assets/icon/word.svg",
    title: AppText.read.tr(),
    route: '',
    imageWidth: 200,
    imageHeight: 78,
    // containerWidth: 175,
    // containerHeight: 100,
    imageAligment: Alignment.center,
  ),
  CardTrainingModel(
    background: AppPalette.iosPurple,
    image: "assets/icon/clip.svg",
    title: AppText.acting.tr(),
    route: '',
    imageWidth: 100,
    imageHeight: 100,
    // containerWidth: 175,
    // containerHeight: 100,
    imageAligment: Alignment.bottomLeft,
  ),

  CardTrainingModel(
    background: AppPalette.headingBlueDark,
    image: "assets/icon/stars.svg",
    title: AppText.relax.tr(),
    route: '',
    imageWidth: 100,
    imageHeight: 70,
    // containerWidth: 175,
    // containerHeight: 100,
    imageAligment: Alignment.center,
  ),
];
