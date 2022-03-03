import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final void Function(double rating)? onRatingChanged;
  final Color? color;

  const StarRating({
    Key? key,
    this.starCount = 5,
    this.rating = .0,
    this.onRatingChanged,
    this.color = const Color(0xFFFF9B3F),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (index) => buildStar(context, index)),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: color ?? AppColors.icons,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? AppColors.icons,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? AppColors.icons,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }
}
