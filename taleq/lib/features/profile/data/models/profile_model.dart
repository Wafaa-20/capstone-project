import 'package:flutter/widgets.dart';

class ProfileModel {
  final IconData icon;
  final String title;
  final IconData iconBack;
  final String? route;

  ProfileModel({
    required this.icon,
    required this.title,
    required this.iconBack,
    this.route,
  });
}
