import 'package:cake/core/constants.dart';
import 'package:cake/core/models/models.dart';
import 'package:cake/modules/product/data/datasources/product_back4app_datasource.dart';
import 'package:cake/modules/product/data/repositories/product_repository.dart';
import 'package:cake/modules/product/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_repository_test.mocks.dart';

@GenerateMocks([ProductBack4AppDatasource])
void main() {
  //TODO: Mock Parse Server database to make testing effective
  IProductRepository _repository = ProductRepository(
    datasource: MockProductBack4AppDatasource(),
  );

  List<Product> _products = [
    const Product(
      name: 'Teste1',
      category: ProductCategory.torta,
      size: ProductSize.pequeno,
      rating: 5,
    ),
    // const Product(
    //   name: 'Teste2',
    //   category: ProductCategory.torta,
    //   size: ProductSize.medio,
    //   rating: 3.8,
    // ),
    const Product(
      name: 'Teste3',
      category: ProductCategory.bolo,
      size: ProductSize.pequeno,
      rating: 4.9,
    ),
    const Product(
      name: 'Teste4',
      category: ProductCategory.bolo,
      size: ProductSize.pequeno,
      rating: 4.3,
    ),
    const Product(
      name: 'Teste5',
      category: ProductCategory.bolo,
      size: ProductSize.pequeno,
      rating: 4.3,
    ),
    const Product(
      name: 'Teste6',
      category: ProductCategory.bolo,
      size: ProductSize.pequeno,
      rating: 4.7,
    ),
  ];

  group('Recomended Products', () {
    test('Should return success', () async {
      when(_repository.getRecomended()).thenAnswer((_) async => _products);

      final result = await _repository.getRecomended();
      expect(result, hasLength(Constants.recommendedProductsLimit));
    });

    test('Should throw error', () async {
      when(_repository.getRecomended())
          .thenAnswer((_) => throw const ServerException('Error 500'));

      expect(() => _repository.getRecomended(), throwsException);
    });
  });

  group('Search Products', () {
    ProductFilter filter = const ProductFilter(name: 'test5');
    test('Should return success', () async {
      when(_repository.search(filter)).thenAnswer((_) async => _products);

      final result = await _repository.search(filter);
      expect(result, isNotEmpty);
    });

    test('Should throw error', () async {
      when(_repository.search(filter))
          .thenAnswer((_) => throw const ServerException('Error 500'));

      expect(() => _repository.search(filter), throwsException);
    });
  });
}
