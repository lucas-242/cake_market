import 'dart:convert';

import 'package:cake/modules/product/product.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductTagBack4AppModel {
  final String? objectId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String name;

  ProductTagBack4AppModel({
    this.objectId,
    this.updatedAt,
    this.createdAt,
    required this.name,
  });

  ProductTagBack4AppModel copyWith({
    String? objectId,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? name,
  }) {
    return ProductTagBack4AppModel(
      objectId: objectId ?? this.objectId,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'name': name,
    };
  }

  ParseObject toParse() {
    return ParseObject('ProductTag')
      ..set('objectId', objectId)
      ..set('name', name)
      ..set('updatedAt', updatedAt)
      ..set('createdAt', createdAt);
  }

  ProductTag toProductTag() {
    return ProductTag(
      id: objectId,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory ProductTagBack4AppModel.fromMap(Map<String, dynamic> map) {
    return ProductTagBack4AppModel(
      objectId: map['objectId'],
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'])
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      name: map['name'] ?? '',
    );
  }

  factory ProductTagBack4AppModel.fromParseObject(ParseObject object) {
    return ProductTagBack4AppModel(
      objectId: object.objectId,
      createdAt: object.createdAt,
      updatedAt: object.updatedAt,
      name: object.get('name') ?? '',
    );
  }

  factory ProductTagBack4AppModel.fromProductTag(ProductTag tag) {
    return ProductTagBack4AppModel(
      objectId: tag.id,
      name: tag.name,
      createdAt: tag.createdAt,
      updatedAt: tag.updatedAt,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductTagBack4AppModel.fromJson(String source) =>
      ProductTagBack4AppModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductTagBack4AppModel(objectId: $objectId, updatedAt: $updatedAt, createdAt: $createdAt, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductTagBack4AppModel &&
        other.objectId == objectId &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.name == name;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        name.hashCode;
  }
}
