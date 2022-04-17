import 'package:cake/core/constants.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterPrice extends StatelessWidget {
  final int priceInFilter;
  final Function(int) onPressed;
  const FilterPrice(
      {Key? key, required this.priceInFilter, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: priceInFilter.toDouble(),
      min: 1,
      max: Constants.filterMaxPrice.toDouble(),
      divisions: Constants.filterDivisionsPrice,
      label: 'até ${NumberFormat.currency(
        symbol: 'R\$',
        decimalDigits: 2,
      ).format(priceInFilter)}',
      activeColor: AppColors.accent,
      inactiveColor: AppColors.subAccent,
      onChanged: (value) => onPressed(value.toInt()),
    );
  }
}

// class _ThumbShape extends RoundSliderThumbShape {
//   final _indicatorShape = const RectangularSliderValueIndicatorShape();

//   const _ThumbShape();

//   // @override
//   // void paint(PaintingContext context, Offset center,
//   //     {required Animation<double> activationAnimation,
//   //     required Animation<double> enableAnimation,
//   //     required bool isDiscrete,
//   //     required TextPainter labelPainter,
//   //     required RenderBox parentBox,
//   //     required SliderThemeData sliderTheme,
//   //     required textDirection,
//   //     required double value,
//   //     required double textScaleFactor,
//   //     required Size sizeWithOverflow}) {
//   //   super.paint(
//   //     context,
//   //     center,
//   //     activationAnimation: activationAnimation,
//   //     enableAnimation: enableAnimation,
//   //     sliderTheme: sliderTheme,
//   //     value: value,
//   //     textScaleFactor: textScaleFactor,
//   //     sizeWithOverflow: sizeWithOverflow,
//   //     isDiscrete: isDiscrete,
//   //     labelPainter: labelPainter,
//   //     parentBox: parentBox,
//   //     textDirection: textDirection,
//   //   );
//   //   _indicatorShape.paint(
//   //     context,
//   //     center,
//   //     activationAnimation: const AlwaysStoppedAnimation(1),
//   //     enableAnimation: enableAnimation,
//   //     labelPainter: labelPainter,
//   //     parentBox: parentBox,
//   //     sliderTheme: sliderTheme,
//   //     value: value,
//   //     // test different testScaleFactor to find your best fit
//   //     textScaleFactor: 0.75,
//   //     sizeWithOverflow: sizeWithOverflow,
//   //     isDiscrete: isDiscrete,
//   //     textDirection: textDirection,
//   //   );
//   // }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     required bool isDiscrete,
//     required TextPainter labelPainter,
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required textDirection,
//     required double value,
//     required double textScaleFactor,
//     required Size sizeWithOverflow,
//   }) {
//     final Canvas canvas = context.canvas;
//     final Tween<double> radiusTween = Tween<double>(
//       begin: 0,
//       end: enabledThumbRadius,
//     );
//     final ColorTween colorTween = ColorTween(
//       begin: sliderTheme.disabledThumbColor,
//       end: sliderTheme.thumbColor,
//     );

//     final Color color = colorTween.evaluate(enableAnimation)!;
//     final double radius = radiusTween.evaluate(enableAnimation);

//     final Tween<double> elevationTween = Tween<double>(
//       begin: elevation,
//       end: pressedElevation,
//     );

//     final double evaluatedElevation =
//         elevationTween.evaluate(const AlwaysStoppedAnimation(1));
//     final Path path = Path()
//       ..addArc(
//           Rect.fromCenter(
//               center: center, width: 2 * radius, height: 2 * radius),
//           0,
//           pi * 2);
//     canvas.drawShadow(path, Colors.black, evaluatedElevation, true);

//     canvas.drawCircle(
//       center,
//       radius,
//       Paint()..color = color,
//     );

//     _indicatorShape.paint(
//       context,
//       center,
//       activationAnimation: const AlwaysStoppedAnimation(1),
//       enableAnimation: enableAnimation,
//       labelPainter: labelPainter,
//       parentBox: parentBox,
//       sliderTheme: sliderTheme,
//       value: value,
//       // test different testScaleFactor to find your best fit
//       textScaleFactor: 0.75,
//       sizeWithOverflow: sizeWithOverflow,
//       isDiscrete: isDiscrete,
//       textDirection: textDirection,
//     );
//   }
// }
