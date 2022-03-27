import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CakeTagBack4AppModel {
  String? objectId;
  DateTime? updatedAt;
  DateTime? createdAt;
  String name;

  CakeTagBack4AppModel({
    this.objectId,
    this.updatedAt,
    this.createdAt,
    required this.name,
  });

  CakeTagBack4AppModel copyWith({
    String? objectId,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? name,
  }) {
    return CakeTagBack4AppModel(
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

  factory CakeTagBack4AppModel.fromMap(Map<String, dynamic> map) {
    return CakeTagBack4AppModel(
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

  factory CakeTagBack4AppModel.fromParseObject(ParseObject object) {
    return CakeTagBack4AppModel(
      objectId: object.objectId,
      createdAt: object.createdAt,
      updatedAt: object.updatedAt,
      name: object.get('name') ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CakeTagBack4AppModel.fromJson(String source) =>
      CakeTagBack4AppModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CakeTagParse(objectId: $objectId, updatedAt: $updatedAt, createdAt: $createdAt, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CakeTagBack4AppModel &&
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
