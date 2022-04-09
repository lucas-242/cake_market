import 'package:flutter/material.dart';

class PriceSlider extends StatelessWidget {
  const PriceSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: 20,
      max: 200,
      divisions: 10,
      label: 20.round().toString(),
      onChanged: (double value) {},
    );
  }
}
