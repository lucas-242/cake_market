import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class TextWithButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final IconData? icon;

  const TextWithButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.fontSize = 20.0,
    this.textColor = AppColors.primary,
    this.buttonColor = AppColors.primary,
    this.icon = Icons.more_horiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: IconButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            splashRadius: 20,
            splashColor: Colors.white,
            focusColor: Colors.white,
            highlightColor: Colors.white,
            iconSize: 36,
            color: buttonColor,
            icon: Icon(icon),
          ),
        )
      ],
    );
  }
}
