class NavigationModel {
  final String svgPath;
  final String label;

  const NavigationModel({required this.svgPath, required this.label});
}

final List<NavigationModel> items = [
  NavigationModel(svgPath: 'assets/image/5.svg', label: "الرئيسية"),
  NavigationModel(svgPath: 'assets/image/4.svg', label: "المجموعات"),
  NavigationModel(svgPath: 'assets/image/3.svg', label: "خطتي"),
  NavigationModel(svgPath: 'assets/image/2.svg', label: "الأخصائيين"),
  NavigationModel(svgPath: 'assets/image/1.svg', label: "التمارين"),
];
