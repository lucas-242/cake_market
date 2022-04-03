import 'package:cake/modules/product/domain/domain.dart';

abstract class IProductDatasource {
  Future<List<Product>> get();
  Future<List<Product>> getRecomended();
  Future<List<Product>> search(ProductFilter filter);
}
