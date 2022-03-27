class CakeTag {
  String? objectId;
  DateTime? updatedAt;
  DateTime? createdAt;
  String name;

  CakeTag({
    this.objectId,
    this.createdAt,
    this.updatedAt,
    required this.name,
  });
}
