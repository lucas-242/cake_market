import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/star_rating/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CakeDetails extends StatelessWidget {
  final dynamic cake;
  const CakeDetails({Key? key, required this.cake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            top(),
            const SizedBox(height: DefaultStyle.heightSmallSpace),
            Padding(
              padding: const EdgeInsets.only(
                top: DefaultStyle.heightSmallSpace,
                right: DefaultStyle.paddingValue * 1.2,
                left: DefaultStyle.paddingValue * 1.2,
              ),
              child: ReadMoreText(
                cake['description'],
                style: const TextStyle(
                    color: AppColors.secondaryTexts,
                    height: 1.5,
                    fontWeight: FontWeight.w500),
                trimLines: 3,
                colorClickableText: AppColors.primary,
                moreStyle: const TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w500),
                lessStyle: const TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w500),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Mostrar mais',
                trimExpandedText: 'Mostrar menos',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget top() {
    return Container(
      color: Colors.blue,
      height: SizeConfig.height * 0.52,
      child: Stack(
        children: [
          // ImageSelector(
          //   image: cake['image'],
          //   width: SizeConfig.width,
          //   height: SizeConfig.height * 0.40,
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: DefaultStyle.roundedShapeRadius,
              ),
              width: SizeConfig.width,
              height: SizeConfig.height * 0.4,
            ),
          ),
          Positioned(
            top: SizeConfig.height * 0.35,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: DefaultStyle.paddingValue * 1.2),
              child: Container(
                width: SizeConfig.width,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: DefaultStyle.roundedSmallShapeRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cake['name'],
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: DefaultStyle.heightSmallSpace),
                    Text(
                      cake['type'],
                      style: const TextStyle(
                        color: AppColors.secondaryTexts,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            StarRating(
                              rating: cake['rating'],
                            ),
                            const SizedBox(width: DefaultStyle.widthTinySpace),
                            Text('(${cake['rating'].toString()})'),
                          ],
                        ),
                        Container(
                          color: Colors.black,
                          width: 50,
                          height: 35,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
