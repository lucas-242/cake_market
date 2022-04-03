import 'package:cake/modules/product/domain/domain.dart';

class GetRecomendedProducts {
  final IProductRepository _productRepository;
  GetRecomendedProducts({required IProductRepository productRepository})
      : _productRepository = productRepository;

  Future<List<Product>> call() async {
    return await _productRepository.getRecomended();
  }
}
