import 'package:cake/modules/product/domain/domain.dart';

class ProductFilter {
  String? name;
  ProductCategory? category;
  ProductSize? size;
  double? rating;
  double? price;
  bool? isPromotion;
  ProductFilterOrder? order;

  ProductFilter({
    this.name,
    this.category,
    this.size,
    this.rating,
    this.price,
    this.isPromotion,
    this.order = ProductFilterOrder.defaultOrder,
  });
}
