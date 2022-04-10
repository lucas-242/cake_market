import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:flutter/material.dart';

class FilterCategory extends StatelessWidget {
  final ProductCategory category;
  final bool isSelected;
  final void Function(ProductCategory) onPressed;

  const FilterCategory({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  String get _name {
    switch (category) {
      case ProductCategory.bebida:
        return 'Bebida';
      case ProductCategory.bolo:
        return 'Bolo';
      case ProductCategory.doce:
        return 'Doce';
      case ProductCategory.salgado:
        return 'Salgado';
      case ProductCategory.torta:
        return 'Torta';
      case ProductCategory.tortaSalgada:
        return 'Torta Salgada';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : Colors.grey[300],
          borderRadius: DefaultStyle.roundedShapeRadius,
        ),
        child: InkWell(
          onTap: () => onPressed(category),
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
            _name,
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              fontSize: 16,
            ),
          )),
        ),
      ),
    );
  }
}
