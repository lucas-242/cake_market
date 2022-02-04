import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/rounded_icon_button/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 13.8,
            height: SizeConfig.blockSizeHorizontal * 13.8,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.amber,
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          Row(
            children: const [
              Icon(Icons.room),
              SizedBox(width: 5),
              Text('Bangu, Rio de Janeiro'),
            ],
          ),
          RoundedIconButton(
            icon: Icons.add_alert,
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
