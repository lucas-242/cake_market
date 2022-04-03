import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/home/presentation/widgets/text_with_button.dart';
import 'package:flutter/material.dart';

class RecomendedSection extends StatelessWidget {
  final Function(Product) onPressedRecomended;
  final VoidCallback onPressedMore;
  final List<Product> recomended;
  const RecomendedSection({
    Key? key,
    required this.onPressedMore,
    required this.recomended,
    required this.onPressedRecomended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: DefaultStyle.paddingValue, bottom: 10.0),
          child: TextWithButton(
            onPressed: onPressedMore,
            text: 'Melhores avaliados',
            buttonColor: AppColors.icons,
          ),
        ),
        SizedBox(
          height: SizeConfig.height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recomended.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onPressedRecomended(recomended[index]),
                child: Container(
                  margin: EdgeInsets.only(
                    left: DefaultStyle.paddingValue,
                    right: index + 1 == recomended.length
                        ? DefaultStyle.paddingValue
                        : 0,
                  ),
                  width: SizeConfig.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: DefaultStyle.roundedShapeRadius,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.logo,
                        height: SizeConfig.height * 0.38,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 25),
                          child: Text(
                            recomended[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
