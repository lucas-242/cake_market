import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Color backgroundColor;
  final Color color;

  const RoundedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.height,
    this.width,
    this.backgroundColor = AppColors.accent,
    this.color = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? DefaultStyle.buttonWidth,
        height: height ?? DefaultStyle.buttonHeight,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: backgroundColor,
          borderRadius: DefaultStyle.roundedTinyShapeRadius,
        ),
        child: Icon(icon, color: color),
      ),
    );
  }
}
