import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/product/presentation/widgets/size_button.dart';
import 'package:flutter/material.dart';

class SizeButtonsRow extends StatelessWidget {
  final ProductSize selectedValue;
  final ValueChanged<ProductSize> onChanged;
  const SizeButtonsRow({
    Key? key,
    required this.onChanged,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizeButton(
          text: 'P',
          value: ProductSize.pequeno,
          isSelected: selectedValue == ProductSize.pequeno,
          onChanged: onChanged,
        ),
        SizeButton(
          text: 'M',
          value: ProductSize.medio,
          isSelected: selectedValue == ProductSize.medio,
          onChanged: onChanged,
        ),
        SizeButton(
          text: 'G',
          value: ProductSize.grande,
          isSelected: selectedValue == ProductSize.grande,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
