import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/home/presentation/widgets/text_with_button.dart';
import 'package:flutter/material.dart';

class HomeRecomended extends StatelessWidget {
  final VoidCallback onPressedMore;
  const HomeRecomended({Key? key, required this.onPressedMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
          child: TextWithButton(
            onPressed: onPressedMore,
            text: 'Recomendados',
          ),
        ),
        SizedBox(
          height: SizeConfig.height * 0.38,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 25,
                      // right: index + 1 == controller.companies?.length
                      right: index + 1 == 5 ? 25 : 0),
                  width: SizeConfig.width * 0.60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Image.asset(
                    AppImages.logo,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
