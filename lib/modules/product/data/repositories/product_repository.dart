import 'package:cake/modules/product/domain/domain.dart';

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource;

  ProductRepository({required IProductDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Product> add(Product product) => _datasource.add(product);

  @override
  Future<List<Product>> getRecomended() => _datasource.getRecommended();

  @override
  Future<List<Product>> search(ProductFilter filter) =>
      _datasource.search(filter);

  @override
  Future<ProductTag> addTag(ProductTag tag) => _datasource.addTag(tag);

  @override
  Future<void> deleteTag(ProductTag tag) => _datasource.deleteTag(tag);
}
