import 'package:cake/core/helpers/product_category_helper.dart';
import 'package:cake/modules/product/product.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final DateTime? updatedAt;
  final DateTime? createdAt;
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
    this.id = '',
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
    this.updatedAt,
    this.createdAt,
  }) : _category = category;

  String get category => ProductCategoryHelper.getName(_category);

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

  Product copyWith({
    String? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? name,
    String? description,
    ProductCategory? category,
    double? rating,
    ProductSize? size,
    String? image,
    double? price,
    bool? isPromotion,
    double? discount,
    List<ProductTag>? tags,
  }) {
    return Product(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? _category,
      rating: rating ?? this.rating,
      size: size ?? this.size,
      image: image ?? this.image,
      price: price ?? this.price,
      isPromotion: isPromotion ?? this.isPromotion,
      discount: discount ?? this.discount,
      tags: tags ?? this.tags,
    );
  }
}
