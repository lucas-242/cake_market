class ProductTag {
  final String? id;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String name;

  ProductTag({
    this.id = '',
    this.createdAt,
    this.updatedAt,
    required this.name,
  });
}
