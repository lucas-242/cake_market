import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/star_rating/star_rating.dart';
import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/product/presentation/widgets/quantity_buttons_row.dart';
import 'package:cake/modules/product/presentation/widgets/size_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductSize selectedValue = ProductSize.pequeno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              top(),
              const SizedBox(height: DefaultStyle.heightSmallSpace),
              widget.product.description != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: DefaultStyle.heightSmallSpace,
                        right: DefaultStyle.paddingValue * 1.2,
                        left: DefaultStyle.paddingValue * 1.2,
                      ),
                      child: ReadMoreText(
                        widget.product.description!,
                        style: const TextStyle(
                            color: AppColors.secondaryTexts,
                            height: 1.5,
                            fontWeight: FontWeight.w500),
                        trimLines: 3,
                        colorClickableText: AppColors.accent,
                        moreStyle: const TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w500),
                        lessStyle: const TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w500),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Mostrar mais',
                        trimExpandedText: 'Mostrar menos',
                      ),
                    )
                  : Container(),
              const SizedBox(height: DefaultStyle.heightSpace),
              Padding(
                padding: const EdgeInsets.only(
                  right: DefaultStyle.paddingValue * 1.2,
                  left: DefaultStyle.paddingValue * 1.2,
                ),
                child: SizeButtonsRow(
                  selectedValue: selectedValue,
                  onChanged: (value) => setState(() => selectedValue = value),
                ),
              ),
              const SizedBox(height: DefaultStyle.heightSpace),
              Padding(
                padding: const EdgeInsets.only(
                  right: DefaultStyle.paddingValue * 1.2,
                  left: DefaultStyle.paddingValue * 1.2,
                ),
                child: SizedBox(
                  width: SizeConfig.width,
                  child: ElevatedButton(
                    onPressed: () => print('booking'),
                    child: const Text('Pedir agora'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.accent),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                        vertical: 20,
                      )),
                      textStyle:
                          MaterialStateProperty.all<TextStyle>(const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: DefaultStyle.roundedTinyShapeRadius,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: DefaultStyle.heightSpace),
            ],
          ),
        ),
      ),
    );
  }

  Widget top() {
    return SizedBox(
      height: SizeConfig.height * 0.52,
      child: Stack(
        children: [
          // ImageSelector(
          //   image: product['image'],
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
                      widget.product.name,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: DefaultStyle.heightSmallSpace),
                    Text(
                      widget.product.type,
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
                              rating: widget.product.rating,
                            ),
                            const SizedBox(width: DefaultStyle.widthTinySpace),
                            Text('(${widget.product.rating.toString()})'),
                          ],
                        ),
                        const QuantityButtonsRow(quantity: 1),
                        // Container(
                        //   color: Colors.black,
                        //   width: 50,
                        //   height: 35,
                        // )
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
