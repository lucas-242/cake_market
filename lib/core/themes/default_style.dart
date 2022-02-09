import 'package:cake/core/themes/themes.dart';
import 'package:flutter/widgets.dart';

class DefaultStyle {
  static final buttonWidth = SizeConfig.blockSizeHorizontal * 13.8;
  static final buttonHeight = SizeConfig.blockSizeHorizontal * 13.8;

  static final roundedTinyShapeRadius = BorderRadius.circular(20.0);
  static final roundedSmallShapeRadius = BorderRadius.circular(25.0);
  static final roundedShapeRadius = BorderRadius.circular(30.0);

  static const heightTinySpace = 5.0;
  static const heightSmallSpace = 10.0;
  static const heightSpace = 25.0;
  static const widthTinySpace = 5.0;
  static const widthSmallSpace = 10.0;
  static const widthSpace = 25.0;

  static const paddingValue = 25.0;
  static const paddingHorizontal =
      EdgeInsets.symmetric(horizontal: paddingValue);
  static const paddingTopHorizontal = EdgeInsets.only(
    top: paddingValue,
    left: paddingValue,
    right: paddingValue,
  );
}
