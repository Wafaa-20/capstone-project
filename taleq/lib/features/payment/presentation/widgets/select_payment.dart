import 'package:flutter/material.dart';

class SelectPayment extends StatelessWidget {
  const SelectPayment({
    super.key,
    required this.text,
    required this.image,
    this.textStyle,
    this.height,
    this.width,
    this.withIcon = false,
    this.onTap,
  });
  final String text;
  final String image;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final bool withIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            image,
            height: height ?? 40,
            width: width ?? 40,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style:
                textStyle ??
                TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          withIcon ? Icon(Icons.arrow_forward_ios, size: 15) : SizedBox(),
        ],
      ),
    );
  }
}
