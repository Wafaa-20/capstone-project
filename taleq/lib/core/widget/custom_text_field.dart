import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.onChanged,

    this.labelText,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.labelstyle,
    this.hintstyle,
    this.textstyle,

    this.fieldKey,
    this.keyboardType,
    this.maxLines,
    this.minLines,
  });
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextStyle? labelstyle;
  final TextStyle? hintstyle;
  final TextStyle? textstyle;

  final Key? fieldKey;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),

          child: Text(labelText ?? "", style: labelstyle ?? TextStyles.sf40018),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText!,
          style: textstyle,
          key: fieldKey,
          maxLines: maxLines ?? 1,
          minLines: minLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintstyle,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
