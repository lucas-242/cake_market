import 'package:cake/modules/cake/cake.dart';
import 'package:cake/modules/cake/presentation/widgets/size_button.dart';
import 'package:flutter/material.dart';

class SizeButtonsRow extends StatelessWidget {
  final CakeSize selectedValue;
  final ValueChanged<CakeSize> onChanged;
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
          value: CakeSize.pequeno,
          isSelected: selectedValue == CakeSize.pequeno,
          onChanged: onChanged,
        ),
        SizeButton(
          text: 'M',
          value: CakeSize.medio,
          isSelected: selectedValue == CakeSize.medio,
          onChanged: onChanged,
        ),
        SizeButton(
          text: 'G',
          value: CakeSize.grande,
          isSelected: selectedValue == CakeSize.grande,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
