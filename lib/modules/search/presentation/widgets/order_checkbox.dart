import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class OrderCheckbox extends StatelessWidget {
  const OrderCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 15,
            height: SizeConfig.blockSizeHorizontal * 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              border: Border.all(
                width: 2,
                color: AppColors.inputText,
              ),
            ),
            child: const Icon(
              Icons.pending_actions,
              color: AppColors.accent,
              // size: 36,
            ),
          ),
          const SizedBox(height: DefaultStyle.heightTinySpace),
          const Text(
            'Ordenação Padrão',
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
