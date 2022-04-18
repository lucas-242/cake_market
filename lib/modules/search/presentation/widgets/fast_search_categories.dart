import 'package:cake/core/helpers/product_category_helper.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/image_selector/image_selector.dart';
import 'package:cake/modules/product/domain/domain.dart';
import 'package:flutter/material.dart';

class FastSearchCategories extends StatelessWidget {
  final void Function(ProductCategory) onPressed;
  const FastSearchCategories({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categorias',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: DefaultStyle.heightSpace),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: SizeConfig.width * 0.5,
            crossAxisSpacing: 15,
            mainAxisExtent: SizeConfig.height * 0.17,
            mainAxisSpacing: 10,
          ),
          itemCount: ProductCategory.values.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onPressed(ProductCategory.values[index]),
              child: _image(ProductCategory.values[index]),
            );
          },
        ),
      ],
    );
  }

  Widget _image(ProductCategory category) {
    return Stack(
      children: [
        ImageSelector(
          image: ProductCategoryHelper.getImage(category),
          isNetworkImage: false,
          height: SizeConfig.height * 0.2,
          width: SizeConfig.width * 0.5,
          borderRadius: DefaultStyle.roundedTinyShapeRadius,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.25),
            borderRadius: DefaultStyle.roundedTinyShapeRadius,
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Text(
            ProductCategoryHelper.getName(category),
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
