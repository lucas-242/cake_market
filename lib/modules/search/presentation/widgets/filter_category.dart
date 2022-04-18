import 'package:cake/core/helpers/product_category_helper.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';

class FilterCategory extends StatelessWidget {
  final List<ProductCategory>? categoriesInFilter;
  final void Function(ProductCategory) onPressed;

  const FilterCategory({
    Key? key,
    required this.categoriesInFilter,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: SizeConfig.width * 0.27,
        crossAxisSpacing: 10,
        mainAxisExtent: SizeConfig.height * 0.052,
        mainAxisSpacing: 10,
      ),
      itemCount: ProductCategory.values.length,
      itemBuilder: (context, index) => FilterButton(
          text: ProductCategoryHelper.getName(ProductCategory.values[index]),
          isSelected: _checkCategoryIsSelect(
            categoriesInFilter,
            ProductCategory.values[index],
          ),
          onPressed: () => onPressed(ProductCategory.values[index])),
    );
  }

  bool _checkCategoryIsSelect(
    List<ProductCategory>? categories,
    ProductCategory categorySelected,
  ) {
    if (categories == null) return false;

    var found = categories.where((element) => element == categorySelected);
    if (found.isEmpty) return false;

    return true;
  }
}
