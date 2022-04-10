import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onPressed;

  const FilterButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : Colors.grey[300],
          borderRadius: DefaultStyle.roundedShapeRadius,
        ),
        child: InkWell(
          onTap: () => onPressed(),
          splashColor: AppColors.accent,
          focusColor: AppColors.accent,
          hoverColor: AppColors.accent,
          overlayColor: MaterialStateProperty.all<Color>(AppColors.accent),
          highlightColor: AppColors.accent,
          customBorder: RoundedRectangleBorder(
            borderRadius: DefaultStyle.roundedShapeRadius,
          ),
          child: Center(
              child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 1,
            softWrap: false,
            style: const TextStyle(
              fontSize: 14,
            ),
          )),
        ),
      ),
    );
  }
}
