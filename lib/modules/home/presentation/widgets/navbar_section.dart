import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/rounded_icon_button/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class NavbarSection extends StatelessWidget {
  const NavbarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DefaultStyle.paddingTopHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: DefaultStyle.buttonWidth,
            height: DefaultStyle.buttonHeight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.amber,
              borderRadius: DefaultStyle.roundedTinyShapeRadius,
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.room,
                color: AppColors.accent,
                size: 20,
              ),
              SizedBox(width: DefaultStyle.widthTinySpace),
              Text(
                'Bangu, Rio de Janeiro',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          RoundedIconButton(
            icon: Icons.add_alert,
            onPressed: () => null,
            width: DefaultStyle.buttonWidth,
            height: DefaultStyle.buttonHeight,
          ),
        ],
      ),
    );
  }
}
