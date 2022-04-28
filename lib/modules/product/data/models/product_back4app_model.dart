import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/product/data/models/product_tag_back4app_model.dart';

class ProductBack4AppModel {
  final String name;
  final String? description;
  final String category;
  final double rating;
  final String size;
  final String? image;
  final double? price;
  final bool isPromotion;
  final double? discount;
  final List<ProductTagBack4AppModel>? tags;

  ProductBack4AppModel({
    required this.name,
    this.description,
    required this.category,
    required this.rating,
    required this.size,
    this.image,
    this.price,
    required this.isPromotion,
    this.discount,
    this.tags,
  });

  ProductBack4AppModel copyWith({
    String? name,
    String? description,
    String? category,
    double? rating,
    String? size,
    String? image,
    double? price,
    bool? isPromotion,
    double? discount,
    List<ProductTagBack4AppModel>? tags,
  }) {
    return ProductBack4AppModel(
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      size: size ?? this.size,
      image: image ?? this.image,
      price: price ?? this.price,
      isPromotion: isPromotion ?? this.isPromotion,
      discount: discount ?? this.discount,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'rating': rating,
      'size': size,
      'image': image,
      'price': price,
      'isPromotion': isPromotion,
      'discount': discount,
      'tags': tags?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductBack4AppModel.fromParseObject(ParseObject object) {
    var tags = object.get<List>('tags') ?? [];
    return ProductBack4AppModel(
      name: object.get('name') ?? '',
      description: object.get('description'),
      category: object.get('category'),
      rating: object.get('rating').toDouble() ?? 0.0,
      size: object.get('size'),
      image: object.get('image'),
      price: object.get('price').toDouble(),
      isPromotion: object.get('isPromotion') ?? false,
      discount: object.get('discount')?.toDouble(),
      tags:
          tags.map((e) => ProductTagBack4AppModel.fromParseObject(e)).toList(),
    );
  }

  factory ProductBack4AppModel.fromMap(Map<String, dynamic> map) {
    return ProductBack4AppModel(
      name: map['name'] ?? '',
      description: map['description'],
      category: map['category'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      size: map['size'] ?? '',
      image: map['image'],
      price: map['price']?.toDouble(),
      isPromotion: map['isPromotion'] ?? false,
      discount: map['discount']?.toDouble(),
      tags: map['tags'] != null
          ? List<ProductTagBack4AppModel>.from(
              map['tags']?.map((x) => ProductTagBack4AppModel.fromMap(x)))
          : null,
    );
  }

  Product toProduct() {
    late ProductCategory categoryConverted;
    late ProductSize sizeConverted;

    switch (category) {
      case "bolo":
        categoryConverted = ProductCategory.bolo;
        break;
      case "torta":
        categoryConverted = ProductCategory.torta;
        break;
      case "tortaSalgada":
        categoryConverted = ProductCategory.tortaSalgada;
        break;
      default:
        categoryConverted = ProductCategory.torta;
        break;
    }

    switch (size) {
      case "pequeno":
        sizeConverted = ProductSize.pequeno;
        break;
      case "medio":
        sizeConverted = ProductSize.pequeno;
        break;
      case "grande":
        sizeConverted = ProductSize.grande;
        break;
      default:
        sizeConverted = ProductSize.pequeno;
        break;
    }

    return Product(
      name: name,
      category: categoryConverted,
      description: description,
      image: image,
      rating: rating,
      size: sizeConverted,
      discount: discount,
      isPromotion: isPromotion,
      price: price,
      tags: tags != null && tags!.isNotEmpty
          ? tags!
              .map((e) => ProductTag(
                    id: e.objectId ?? '',
                    name: e.name,
                    createdAt: e.createdAt,
                    updatedAt: e.updatedAt,
                  ))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductBack4AppModel.fromJson(String source) =>
      ProductBack4AppModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductBack4appModel(name: $name, description: $description, category: $category, rating: $rating, size: $size, image: $image, price: $price, isPromotion: $isPromotion, discount: $discount, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductBack4AppModel &&
        other.name == name &&
        other.description == description &&
        other.category == category &&
        other.rating == rating &&
        other.size == size &&
        other.image == image &&
        other.price == price &&
        other.isPromotion == isPromotion &&
        other.discount == discount &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        category.hashCode ^
        rating.hashCode ^
        size.hashCode ^
        image.hashCode ^
        price.hashCode ^
        isPromotion.hashCode ^
        discount.hashCode ^
        tags.hashCode;
  }
}
