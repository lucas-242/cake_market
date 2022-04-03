import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  const ImageSelector({Key? key, required this.image, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: image != null && image != ''
            ? Image.network(image!)
            : Image.asset(AppImages.noImage));
  }
}
