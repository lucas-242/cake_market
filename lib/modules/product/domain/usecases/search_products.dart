import 'package:cake/modules/product/domain/domain.dart';

class SearchProducts {
  final IProductRepository _productRepository;

  SearchProducts({required IProductRepository productRepository})
      : _productRepository = productRepository;

  Future<List<Product>> call(String text) {
    return _productRepository.search(text);
  }
}
