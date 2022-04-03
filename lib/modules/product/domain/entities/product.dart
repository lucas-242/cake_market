import 'package:cake/modules/product/product.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String? description;
  final ProductType _type;
  final double rating;
  final ProductSize size;
  final String? image;
  final double? price;
  final bool isPromotion;
  final double? discount;
  final List<ProductTag>? tags;

  const Product({
    required this.name,
    required ProductType type,
    this.rating = 0,
    this.description,
    this.image,
    required this.size,
    this.price,
    this.isPromotion = false,
    this.discount,
    this.tags,
  }) : _type = type;

  String get type {
    switch (_type) {
      case ProductType.bolo:
        return 'Bolo';
      case ProductType.torta:
        return 'Torta';
      case ProductType.tortaSalgada:
        return 'Torta Salgada';
      default:
        return '';
    }
  }

  @override
  List<Object?> get props => [
        name,
        _type,
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
