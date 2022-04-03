import 'package:cake/modules/product/domain/domain.dart';

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource;

  ProductRepository({required IProductDatasource datasource})
      : _datasource = datasource;

  @override
  Future<List<Product>> get() => _datasource.get();

  @override
  Future<List<Product>> getRecomended() => _datasource.getRecomended();

  @override
  Future<List<Product>> search(String text) => _datasource.search(text);
}
