import 'package:cake/modules/product/domain/domain.dart';

class GetProducts {
  final IProductRepository _productRepository;
  GetProducts({required IProductRepository productRepository})
      : _productRepository = productRepository;

  Future<List<Product>> call() async {
    return await _productRepository.get();
  }
}
