import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final ProductSize value;
  final String? text;
  final ValueChanged<ProductSize> onChanged;
  final bool isSelected;
  const SizeButton({
    Key? key,
    required this.onChanged,
    required this.value,
    this.text,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onChanged(value),
      child: SizedBox(
        height: SizeConfig.height * 0.085,
        child: Row(
          children: [
            Container(
              width: SizeConfig.width * 0.25,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: isSelected
                    ? Border.all(color: AppColors.accent, width: 2.2)
                    : null,
                borderRadius: DefaultStyle.roundedTinyShapeRadius,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    text ?? value.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? AppColors.accent
                          : AppColors.secondaryTexts,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
