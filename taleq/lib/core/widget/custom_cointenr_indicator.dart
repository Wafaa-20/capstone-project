import 'package:flutter/widgets.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomContainerIndicator extends StatelessWidget {
  const CustomContainerIndicator({
    super.key,
    required this.currentPage,
    required this.visitedPages,
    required this.totalPages,
    this.width,
    this.height,
    this.margin,
    this.spacing,
  });
  final int currentPage;
  final int totalPages;
  final List<int> visitedPages;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: spacing ?? 0.0,
      children: List.generate(
        totalPages,
        (index) => Container(
          width: width ?? 48,
          height: height ?? 6,
          margin: margin ?? EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: visitedPages.contains(index) || index == currentPage
                ? AppPalette.bluePrimary
                : AppPalette.greySurface,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
