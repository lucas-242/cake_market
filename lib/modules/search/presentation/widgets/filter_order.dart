import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:flutter/material.dart';

class FilterOrder extends StatelessWidget {
  final ProductFilterOrder orderSelectedInFilter;
  final void Function(ProductFilterOrder) onPressed;
  const FilterOrder({
    Key? key,
    required this.orderSelectedInFilter,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: ProductFilterOrder.values.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => onPressed(ProductFilterOrder.values[index]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.blockSizeHorizontal * 15,
              height: SizeConfig.blockSizeHorizontal * 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _orderIsSelected(ProductFilterOrder.values[index])
                    ? AppColors.subAccent
                    : AppColors.white,
                border: _orderIsSelected(ProductFilterOrder.values[index])
                    ? const Border.fromBorderSide(BorderSide.none)
                    : Border.all(
                        width: 2,
                        color: AppColors.icons,
                      ),
              ),
              child: Icon(
                _getIcon(ProductFilterOrder.values[index]),
                color: AppColors.accent,
                // size: 36,
              ),
            ),
            const SizedBox(height: DefaultStyle.heightTinySpace),
            Text(
              _getName(ProductFilterOrder.values[index]),
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: _orderIsSelected(ProductFilterOrder.values[index])
                      ? AppColors.accent
                      : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  String _getName(ProductFilterOrder order) {
    switch (order) {
      case ProductFilterOrder.asc:
        return 'Ascendente';
      case ProductFilterOrder.defaultOrder:
        return 'Ordenação Padrão';
      case ProductFilterOrder.desc:
        return 'Descendente';
      case ProductFilterOrder.priceLower:
        return 'Menor Preço';
      case ProductFilterOrder.rating:
        return 'Melhores Avaliados';
    }
  }

  IconData _getIcon(ProductFilterOrder order) {
    switch (order) {
      case ProductFilterOrder.asc:
        return Icons.sort_by_alpha;
      case ProductFilterOrder.defaultOrder:
        return Icons.sort;
      case ProductFilterOrder.desc:
        return Icons.text_rotate_vertical_rounded;
      case ProductFilterOrder.priceLower:
        return Icons.attach_money_rounded;
      case ProductFilterOrder.rating:
        return Icons.star_outline;
    }
  }

  bool _orderIsSelected(ProductFilterOrder order) {
    if (orderSelectedInFilter == order) return true;
    return false;
  }
}
