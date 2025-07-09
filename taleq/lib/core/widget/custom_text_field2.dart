import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomTextField2 extends StatefulWidget {
  const CustomTextField2({
    super.key,
    this.controller,
    required this.text,
    this.obscureText = false,
    this.validator,
    this.lefticon,
    this.onchange,
  });

  final TextEditingController? controller;
  final String text;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Widget? lefticon;
  final void Function(String)? onchange;

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  late final TextEditingController _internalController;
  bool _shouldDispose = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _internalController = widget.controller!;
      _shouldDispose = false;
    } else {
      _internalController = TextEditingController();
      _shouldDispose = true;
    }
  }

  @override
  void dispose() {
    if (_shouldDispose) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onchange,
      style: TextStyles.sf40014.copyWith(color: AppPalette.black),
      controller: _internalController,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: widget.lefticon,
        border: InputBorder.none,
        hintText: widget.text,
        hintStyle: TextStyles.sf40014.copyWith(color: AppPalette.grayPrimary),
      ),
      validator: widget.validator,
    );
  }
}
