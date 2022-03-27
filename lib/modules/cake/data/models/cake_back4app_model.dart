import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:cake/modules/cake/cake.dart';
import 'package:cake/modules/cake/data/models/cake_tag_back4app_model.dart';

class CakeBack4AppModel {
  final String name;
  final String? description;
  final String type;
  final double rating;
  final String size;
  final String? image;
  final double? price;
  final bool isPromotion;
  final double? discount;
  final List<CakeTagBack4AppModel>? tags;

  CakeBack4AppModel({
    required this.name,
    this.description,
    required this.type,
    required this.rating,
    required this.size,
    this.image,
    this.price,
    required this.isPromotion,
    this.discount,
    this.tags,
  });

  CakeBack4AppModel copyWith({
    String? name,
    String? description,
    String? type,
    double? rating,
    String? size,
    String? image,
    double? price,
    bool? isPromotion,
    double? discount,
    List<CakeTagBack4AppModel>? tags,
  }) {
    return CakeBack4AppModel(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
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
      'type': type,
      'rating': rating,
      'size': size,
      'image': image,
      'price': price,
      'isPromotion': isPromotion,
      'discount': discount,
      'tags': tags?.map((x) => x.toMap()).toList(),
    };
  }

  factory CakeBack4AppModel.fromParseObject(ParseObject object) {
    var tags = object.get<List>('tags') ?? [];
    return CakeBack4AppModel(
      name: object.get('name') ?? '',
      description: object.get('description'),
      type: object.get('type'),
      rating: object.get('rating').toDouble() ?? 0.0,
      size: object.get('size'),
      image: object.get('image'),
      price: object.get('price').toDouble(),
      isPromotion: object.get('isPromotion') ?? false,
      discount: object.get('discount')?.toDouble(),
      tags: tags.map((e) => CakeTagBack4AppModel.fromParseObject(e)).toList(),
    );
  }

  factory CakeBack4AppModel.fromMap(Map<String, dynamic> map) {
    return CakeBack4AppModel(
      name: map['name'] ?? '',
      description: map['description'],
      type: map['type'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      size: map['size'] ?? '',
      image: map['image'],
      price: map['price']?.toDouble(),
      isPromotion: map['isPromotion'] ?? false,
      discount: map['discount']?.toDouble(),
      tags: map['tags'] != null
          ? List<CakeTagBack4AppModel>.from(
              map['tags']?.map((x) => CakeTagBack4AppModel.fromMap(x)))
          : null,
    );
  }

  Cake toCake() {
    late CakeType typeConverted;
    late CakeSize sizeConverted;

    switch (type) {
      case "bolo":
        typeConverted = CakeType.bolo;
        break;
      case "torta":
        typeConverted = CakeType.torta;
        break;
      case "tortaSalgada":
        typeConverted = CakeType.tortaSalgada;
        break;
      default:
        typeConverted = CakeType.torta;
        break;
    }

    switch (size) {
      case "pequeno":
        sizeConverted = CakeSize.pequeno;
        break;
      case "medio":
        sizeConverted = CakeSize.pequeno;
        break;
      case "grande":
        sizeConverted = CakeSize.grande;
        break;
      default:
        sizeConverted = CakeSize.pequeno;
        break;
    }

    return Cake(
      name: name,
      type: typeConverted,
      description: description,
      image: image,
      rating: rating,
      size: sizeConverted,
      discount: discount,
      isPromotion: isPromotion,
      price: price,
      tags: tags != null && tags!.isNotEmpty
          ? tags!
              .map((e) => CakeTag(
                    name: e.name,
                    createdAt: e.createdAt,
                    objectId: e.objectId,
                    updatedAt: e.updatedAt,
                  ))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CakeBack4AppModel.fromJson(String source) =>
      CakeBack4AppModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CakeBack4appModel(name: $name, description: $description, type: $type, rating: $rating, size: $size, image: $image, price: $price, isPromotion: $isPromotion, discount: $discount, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CakeBack4AppModel &&
        other.name == name &&
        other.description == description &&
        other.type == type &&
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
        type.hashCode ^
        rating.hashCode ^
        size.hashCode ^
        image.hashCode ^
        price.hashCode ^
        isPromotion.hashCode ^
        discount.hashCode ^
        tags.hashCode;
  }
}
