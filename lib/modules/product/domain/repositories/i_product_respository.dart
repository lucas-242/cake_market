import 'package:cake/modules/product/domain/domain.dart';

abstract class IProductRepository {
  Future<Product> add(Product product);
  Future<ProductTag> addTag(ProductTag tag);
  Future<void> deleteTag(ProductTag tag);
  Future<List<Product>> getRecomended();
  Future<List<Product>> search(ProductFilter filter);
}
