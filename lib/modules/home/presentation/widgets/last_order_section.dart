import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/home/presentation/widgets/text_with_button.dart';
import 'package:flutter/material.dart';

class LastOrderSection extends StatelessWidget {
  final VoidCallback onPressedMore;
  final List<dynamic> orders;
  const LastOrderSection({
    Key? key,
    required this.onPressedMore,
    required this.orders,
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
            text: 'Últimas compras',
          ),
        ),
        SizedBox(
          height: SizeConfig.height * 0.37,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: Container(
                    height: SizeConfig.height * 0.15,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  DefaultStyle.roundedSmallShapeRadius,
                            ),
                            child: Image.asset(
                              orders[index]['image'],
                              width: SizeConfig.width * 0.21,
                              height: SizeConfig.height * 0.20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orders[index]['name'],
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                    height: DefaultStyle.heightSmallSpace),
                                Text(
                                  orders[index]['type'],
                                  style: const TextStyle(
                                    color: AppColors.secondaryTexts,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
