import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class CategoryCheckbox extends StatelessWidget {
  const CategoryCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: DefaultStyle.roundedShapeRadius,
        ),
        child: InkWell(
          onTap: () => null,
          splashColor: AppColors.accent,
          focusColor: AppColors.accent,
          hoverColor: AppColors.accent,
          overlayColor: MaterialStateProperty.all<Color>(AppColors.accent),
          highlightColor: AppColors.accent,
          customBorder: RoundedRectangleBorder(
            borderRadius: DefaultStyle.roundedShapeRadius,
          ),
          child: const Center(
              child: Text(
            'Teste',
            style: TextStyle(
              fontSize: 16,
            ),
          )),
        ),
      ),
    );
  }
}
