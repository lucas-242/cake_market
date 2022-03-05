import 'package:cake/modules/cake/presentation/widgets/size_button.dart';
import 'package:flutter/material.dart';

class SizeButtonsRow extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String> onChanged;
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
          text: 'S',
          value: 'S',
          isSelected: selectedValue == 'S',
          onChanged: onChanged,
        ),
        SizeButton(
          text: 'M',
          value: 'M',
          isSelected: selectedValue == 'M',
          onChanged: onChanged,
        ),
        SizeButton(
          text: 'L',
          value: 'L',
          isSelected: selectedValue == 'L',
          onChanged: onChanged,
        ),
      ],
    );
  }
}
