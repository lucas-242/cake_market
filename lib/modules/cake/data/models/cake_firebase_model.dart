import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cake/modules/cake/domain/domain.dart';

class CakeFirebaseModel {
  final String name;
  final String? description;
  final String type;
  final double rating;
  final String size;
  final String? image;
  final double? price;
  final bool isPromotion;
  final double? discount;
  final List<String>? tags;

  CakeFirebaseModel({
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

  CakeFirebaseModel copyWith({
    String? name,
    String? description,
    String? type,
    double? rating,
    String? size,
    String? image,
    double? price,
    bool? isPromotion,
    double? discount,
    List<String>? tags,
  }) {
    return CakeFirebaseModel(
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
      'tags': tags,
    };
  }

  factory CakeFirebaseModel.fromMap(Map<String, dynamic> map) {
    return CakeFirebaseModel(
      name: map['name'] ?? '',
      description: map['description'],
      type: map['type'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      size: map['size'] ?? '',
      image: map['image'],
      price: map['price']?.toDouble(),
      isPromotion: map['isPromotion'] ?? false,
      discount: map['discount']?.toDouble(),
      tags: List<String>.from(map['tags']),
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
      tags: tags,
    );
  }

  String toJson() => json.encode(toMap());

  factory CakeFirebaseModel.fromJson(String source) =>
      CakeFirebaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CakeFirebaseModel(name: $name, description: $description, type: $type, rating: $rating, size: $size, image: $image, price: $price, isPromotion: $isPromotion, discount: $discount, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CakeFirebaseModel &&
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
