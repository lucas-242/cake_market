import 'package:cake/modules/product/domain/domain.dart';

abstract class IProductDatasource {
  Future<List<Product>> getRecommended();
  Future<List<Product>> search(ProductFilter filter);
}
