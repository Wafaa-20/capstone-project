import 'package:easy_localization/easy_localization.dart';
import 'package:taleq/core/text/app_text.dart';

class NavigationModel {
  final String svgPath;
  final String label;

  const NavigationModel({required this.svgPath, required this.label});
}

final List<NavigationModel> items = [
  NavigationModel(svgPath: 'assets/image/5.svg', label: AppText.lable1.tr()),
  NavigationModel(svgPath: 'assets/image/4.svg', label: AppText.lable2.tr()),
  NavigationModel(svgPath: 'assets/image/3.svg', label: AppText.lable3.tr()),
  NavigationModel(svgPath: 'assets/image/2.svg', label: AppText.lable4.tr()),
  NavigationModel(svgPath: 'assets/image/1.svg', label: AppText.lable5.tr()),
];
