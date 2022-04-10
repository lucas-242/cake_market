import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterOrder extends StatelessWidget {
  final ProductFilterOrder order;
  final bool isSelected;
  final void Function(ProductFilterOrder) onPressed;
  const FilterOrder(
      {Key? key,
      required this.order,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  String get _name {
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

  IconData get _icon {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(order),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 15,
            height: SizeConfig.blockSizeHorizontal * 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.subAccent : AppColors.white,
              border: isSelected
                  ? const Border.fromBorderSide(BorderSide.none)
                  : Border.all(
                      width: 2,
                      color: AppColors.icons,
                    ),
            ),
            child: Icon(
              _icon,
              color: AppColors.accent,
              // size: 36,
            ),
          ),
          const SizedBox(height: DefaultStyle.heightTinySpace),
          Text(
            _name,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: isSelected ? AppColors.accent : Colors.black),
          ),
        ],
      ),
    );
  }
}
