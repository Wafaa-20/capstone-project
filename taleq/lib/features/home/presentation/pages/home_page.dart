import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleq/core/text/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.homeAppBar),
        leading: SizedBox(
          width: 25,
          height: 25,
          child: SvgPicture.asset(
            "assets/icon/homeAppBar.svg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Center(child: Text('Welcome to home page!')),
    );
  }
}
