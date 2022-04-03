//* This class needs firebase's extension

// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:cake/modules/product/domain/domain.dart';

// class ProductFirebaseModel {
//   final String name;
//   final String? description;
//   final String category;
//   final double rating;
//   final String size;
//   final String? image;
//   final double? price;
//   final bool isPromotion;
//   final double? discount;
//   final List<String>? tags;

//   ProductFirebaseModel({
//     required this.name,
//     this.description,
//     required this.category,
//     required this.rating,
//     required this.size,
//     this.image,
//     this.price,
//     required this.isPromotion,
//     this.discount,
//     this.tags,
//   });

//   ProductFirebaseModel copyWith({
//     String? name,
//     String? description,
//     String? category,
//     double? rating,
//     String? size,
//     String? image,
//     double? price,
//     bool? isPromotion,
//     double? discount,
//     List<String>? tags,
//   }) {
//     return ProductFirebaseModel(
//       name: name ?? this.name,
//       description: description ?? this.description,
//       category: category ?? this.category,
//       rating: rating ?? this.rating,
//       size: size ?? this.size,
//       image: image ?? this.image,
//       price: price ?? this.price,
//       isPromotion: isPromotion ?? this.isPromotion,
//       discount: discount ?? this.discount,
//       tags: tags ?? this.tags,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'description': description,
//       'category': category,
//       'rating': rating,
//       'size': size,
//       'image': image,
//       'price': price,
//       'isPromotion': isPromotion,
//       'discount': discount,
//       'tags': tags,
//     };
//   }

//   factory ProductFirebaseModel.fromMap(Map<String, dynamic> map) {
//     return ProductFirebaseModel(
//       name: map['name'] ?? '',
//       description: map['description'],
//       category: map['category'] ?? '',
//       rating: map['rating']?.toDouble() ?? 0.0,
//       size: map['size'] ?? '',
//       image: map['image'],
//       price: map['price']?.toDouble(),
//       isPromotion: map['isPromotion'] ?? false,
//       discount: map['discount']?.toDouble(),
//       tags: List<String>.from(map['tags']),
//     );
//   }

//   Product toProduct() {
//     late ProductCategory categoryConverted;
//     late ProductSize sizeConverted;

//     switch (category) {
//       case "bolo":
//         categoryConverted = ProductCategory.bolo;
//         break;
//       case "torta":
//         categoryConverted = ProductCategory.torta;
//         break;
//       case "tortaSalgada":
//         categoryConverted = ProductCategory.tortaSalgada;
//         break;
//     }

//     switch (size) {
//       case "pequeno":
//         sizeConverted = ProductSize.pequeno;
//         break;
//       case "medio":
//         sizeConverted = ProductSize.pequeno;
//         break;
//       case "grande":
//         sizeConverted = ProductSize.grande;
//         break;
//     }

//     return Product(
//       name: name,
//       category: categoryConverted,
//       description: description,
//       image: image,
//       rating: rating,
//       size: sizeConverted,
//       discount: discount,
//       isPromotion: isPromotion,
//       price: price,
//       tags: const [],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ProductFirebaseModel.fromJson(String source) =>
//       ProductFirebaseModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'ProductFirebaseModel(name: $name, description: $description, category: $category, rating: $rating, size: $size, image: $image, price: $price, isPromotion: $isPromotion, discount: $discount, tags: $tags)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is ProductFirebaseModel &&
//         other.name == name &&
//         other.description == description &&
//         other.category == category &&
//         other.rating == rating &&
//         other.size == size &&
//         other.image == image &&
//         other.price == price &&
//         other.isPromotion == isPromotion &&
//         other.discount == discount &&
//         listEquals(other.tags, tags);
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//         description.hashCode ^
//         category.hashCode ^
//         rating.hashCode ^
//         size.hashCode ^
//         image.hashCode ^
//         price.hashCode ^
//         isPromotion.hashCode ^
//         discount.hashCode ^
//         tags.hashCode;
//   }
// }
