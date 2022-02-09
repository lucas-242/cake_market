import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class CallText extends StatelessWidget {
  const CallText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Center(
            child: Text(
              'Busque e Encontre as',
              style: TextStyle(
                fontSize: 32,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        RichText(
          text: const TextSpan(
            text: 'Melhores ',
            children: [
              TextSpan(
                text: 'Tortas',
                style: TextStyle(color: Color(0xFFCB5F5F)),
                // style: TextStyle(color: Color(0xFF1D321D)),
              )
            ],
            style: TextStyle(
              fontSize: 32,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
