import 'dart:convert';

import 'package:cake/modules/cake/domain/domain.dart';

class CakeFirebaseModel {
  final String name;
  final String? description;
  final String type;
  final double rating;
  final String? image;

  CakeFirebaseModel({
    required this.name,
    this.description,
    required this.type,
    required this.rating,
    this.image,
  });

  CakeFirebaseModel copyWith({
    String? name,
    String? description,
    String? type,
    double? rating,
    String? image,
  }) {
    return CakeFirebaseModel(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      rating: rating ?? this.rating,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'type': type,
      'rating': rating,
      'image': image,
    };
  }

  factory CakeFirebaseModel.fromMap(Map<String, dynamic> map) {
    return CakeFirebaseModel(
      name: map['name'] ?? '',
      description: map['description'],
      type: map['type'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      image: map['image'],
    );
  }

  Cake toCake() {
    late CakeType typeConverted;

    switch (type) {
      case "angelCake":
        typeConverted = CakeType.angelCake;
        break;
      case "butterCake":
        typeConverted = CakeType.butterCake;
        break;
      case "chiffonCake":
        typeConverted = CakeType.chiffonCake;
        break;
      case "geneoseCake":
        typeConverted = CakeType.genoeseCake;
        break;
      case "noFluorCake":
        typeConverted = CakeType.noFluorCake;
        break;
      case "spongeCake":
        typeConverted = CakeType.spongeCake;
        break;
      case "vegetableOilCake":
        typeConverted = CakeType.vegetableOilCake;
        break;
    }

    return Cake(
      name: name,
      type: typeConverted,
      description: description,
      image: image,
      rating: rating,
    );
  }

  String toJson() => json.encode(toMap());

  factory CakeFirebaseModel.fromJson(String source) =>
      CakeFirebaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CakeFirebaseModel(name: $name, description: $description, type: $type, rating: $rating, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CakeFirebaseModel &&
        other.name == name &&
        other.description == description &&
        other.type == type &&
        other.rating == rating &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        type.hashCode ^
        rating.hashCode ^
        image.hashCode;
  }
}
