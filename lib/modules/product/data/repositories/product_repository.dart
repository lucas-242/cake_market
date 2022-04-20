import 'package:cake/modules/product/domain/domain.dart';

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource;

  ProductRepository({required IProductDatasource datasource})
      : _datasource = datasource;

  @override
  Future<List<Product>> getRecomended() => _datasource.getRecommended();

  @override
  Future<List<Product>> search(ProductFilter filter) =>
      _datasource.search(filter);
}
