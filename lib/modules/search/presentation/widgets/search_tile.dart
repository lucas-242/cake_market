import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/image_selector/image_selector.dart';
import 'package:cake/modules/product/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchTile extends StatelessWidget {
  final Product product;
  const SearchTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageSelector(
          image: product.image,
          height: DefaultStyle.buttonHeight,
          width: DefaultStyle.buttonWidth,
          borderRadius: DefaultStyle.roundedTinyShapeRadius,
        ),
        const SizedBox(width: DefaultStyle.widthSmallSpace),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: DefaultStyle.heightTinySpace),
            Text(
              NumberFormat.currency(
                symbol: 'R\$',
                decimalDigits: 2,
              ).format(product.price),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}
