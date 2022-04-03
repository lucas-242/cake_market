import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color buttonColor;
  final double paddingBottom;
  final VoidCallback onPressed;
  const QuantityButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.buttonColor,
    required this.onPressed,
    this.paddingBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      focusColor: AppColors.accent,
      splashColor: AppColors.accent,
      hoverColor: AppColors.accent,
      highlightColor: AppColors.accent,
      child: Container(
        width: SizeConfig.height * 0.050,
        height: SizeConfig.height * 0.050,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: DefaultStyle.roundedShapeRadius,
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: paddingBottom),
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
      ),
    );
    // return Container(
    //   color: buttonColor,
    //   child: IconButton(
    //     padding: EdgeInsets.zero,
    //     color: iconColor,
    //     onPressed: onPressed,
    //     icon: Icon(icon),
    //   ),
    // );
  }
}
