import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/cake/presentation/widgets/quantity_button.dart';
import 'package:flutter/material.dart';

class QuantityButtonsRow extends StatelessWidget {
  final int quantity;

  const QuantityButtonsRow({Key? key, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityButton(
          icon: Icons.minimize,
          iconColor: AppColors.accent,
          buttonColor: AppColors.accent.withAlpha(20),
          paddingBottom: 12,
          onPressed: () => print('minus'),
        ),
        const SizedBox(width: DefaultStyle.widthSmallSpace),
        Text(
          quantity.toString(),
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: DefaultStyle.widthSmallSpace),
        QuantityButton(
          icon: Icons.add,
          iconColor: AppColors.white,
          buttonColor: AppColors.accent,
          onPressed: () => print('plus'),
        ),
        // ElevatedButton(
        //   onPressed: null,
        //   child: Container(
        //     child: Center(
        //       child: Icon(
        //         Icons.minimize_outlined,
        //       ),
        //     ),
        //   ),
        //   style: ButtonStyle(
        //     backgroundColor:
        //         MaterialStateProperty.all<Color>(AppColors.secondaryTexts),
        //     foregroundColor: MaterialStateProperty.all<Color>(AppColors.accent),
        //     // padding: MaterialStateProperty.all<EdgeInsets>(
        //     //     const EdgeInsets.symmetric(
        //     //   vertical: 5,
        //     //   horizontal: 5,
        //     // )),
        //     shape: MaterialStateProperty.all<OutlinedBorder>(
        //       RoundedRectangleBorder(
        //         borderRadius: DefaultStyle.roundedShapeRadius,
        //       ),
        //     ),
        //   ),
        // ),
        // Text(quantity.toString()),
        // IconButton(onPressed: null, icon: Icon(Icons.add)),
      ],
    );
  }
}
