import 'package:cake/modules/product/product.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String? description;
  final ProductCategory _category;
  final double rating;
  final ProductSize size;
  final String? image;
  final double? price;
  final bool isPromotion;
  final double? discount;
  final List<ProductTag>? tags;

  const Product({
    required this.name,
    required ProductCategory category,
    this.rating = 0,
    this.description,
    this.image,
    required this.size,
    this.price,
    this.isPromotion = false,
    this.discount,
    this.tags,
  }) : _category = category;

  String get category {
    switch (_category) {
      case ProductCategory.bolo:
        return 'Bolo';
      case ProductCategory.torta:
        return 'Torta';
      case ProductCategory.tortaSalgada:
        return 'Torta Salgada';
      default:
        return '';
    }
  }

  @override
  List<Object?> get props => [
        name,
        _category,
        rating,
        description,
        image,
        size,
        price,
        isPromotion,
        discount,
        tags,
      ];
}
