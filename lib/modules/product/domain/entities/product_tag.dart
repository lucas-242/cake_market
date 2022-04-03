class ProductTag {
  String? objectId;
  DateTime? updatedAt;
  DateTime? createdAt;
  String name;

  ProductTag({
    this.objectId,
    this.createdAt,
    this.updatedAt,
    required this.name,
  });
}
