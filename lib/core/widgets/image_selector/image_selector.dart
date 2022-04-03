import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  const ImageSelector({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: image != null && image != ''
          ? Image.network(
              image!,
              width: width,
              height: height,
            )
          : Image.asset(
              AppImages.noImage,
              fit: BoxFit.fitHeight,
              width: width,
              height: height,
            ),
    );
  }
}
