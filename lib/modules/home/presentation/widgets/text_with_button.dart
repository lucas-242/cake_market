import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class TextWithButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final IconData? icon;
  final FontWeight fontWeight;

  const TextWithButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.fontSize = 20.0,
    this.textColor = AppColors.primary,
    this.buttonColor = AppColors.primary,
    this.icon = Icons.more_horiz,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize, color: textColor, fontWeight: fontWeight),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: IconButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            splashRadius: 20,
            splashColor: AppColors.white,
            focusColor: AppColors.white,
            highlightColor: AppColors.white,
            iconSize: 36,
            color: buttonColor,
            icon: Icon(icon),
          ),
        )
      ],
    );
  }
}
