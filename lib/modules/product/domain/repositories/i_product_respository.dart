import 'package:cake/modules/product/domain/domain.dart';

abstract class IProductRepository {
  Future<List<Product>> get();
  Future<List<Product>> getRecomended();
  Future<List<Product>> search(ProductFilter filter);
}
