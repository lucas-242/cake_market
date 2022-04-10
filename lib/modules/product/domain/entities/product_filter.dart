import 'package:cake/modules/product/domain/domain.dart';

class ProductFilter {
  final String? name;
  final List<ProductCategory>? categories;
  final ProductSize? size;
  final double? rating;
  final double? price;
  final bool? isPromotion;
  final ProductFilterOrder? order;

  const ProductFilter({
    this.name,
    this.categories,
    this.size,
    this.rating,
    this.price,
    this.isPromotion,
    this.order = ProductFilterOrder.defaultOrder,
  });
}
