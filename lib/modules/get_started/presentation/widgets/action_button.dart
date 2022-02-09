import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ActionButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Quero Provar'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.accent),
        // MaterialStateProperty.all<Color>(const Color(0xFF1D321D)),
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        )),
        textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          color: AppColors.white,
          fontSize: 20,
        )),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      // style: ElevatedButton.styleFrom(
      //   primary: const Color(0xFFD8B6A9),
      //   onPrimary: AppColors.white,
      //   padding: const EdgeInsets.symmetric(
      //     vertical: 20,
      //     horizontal: 40,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(50.0),
      //   ),
      //   // shape: OutlinedBorder(side: BorderSide.none),
      //   textStyle: const TextStyle(
      //     color: AppColors.white,
      //     fontSize: 20,
      //   ),
      // ),
    );
  }
}
