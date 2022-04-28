import 'package:cake/modules/product/data/datasources/product_back4app_datasource.dart';
import 'package:cake/modules/product/data/repositories/product_repository.dart';
import 'package:cake/modules/product/product.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/product_repository_mock_helper.dart';

void main() {
  IProductRepository? repository;

  Future<IProductRepository> getRepository() async {
    repository ??= ProductRepository(
      datasource: ProductBack4AppDatasource(),
    );
    return repository!;
  }

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupParseInstance();
    await getRepository();
  });

  tearDown(() async {
    repository = null;
  });

  test('Get recommended products', () async {
    ProductTag tag1 = ProductTag(name: 'aniversário');
    tag1 = await repository!.addTag(tag1);
    ProductTag tag2 = ProductTag(name: 'festa');
    tag2 = await repository!.addTag(tag2);
    ProductTag tag3 = ProductTag(name: 'natal');
    tag3 = await repository!.addTag(tag3);

    final Product product1 = getDummyProduct(rating: 4.6, tags: [tag1]);
    await repository!.add(product1);
    final Product product2 = getDummyProduct(rating: 4.5);
    await repository!.add(product2);
    final Product product3 = getDummyProduct(rating: 4.4, tags: [tag2]);
    await repository!.add(product3);
    final Product product4 = getDummyProduct(rating: 4.3, tags: [tag3]);
    await repository!.add(product4);
    final Product product5 = getDummyProduct(rating: 3.0, tags: [tag1, tag2]);
    await repository!.add(product5);
    final Product product6 =
        getDummyProduct(rating: 4.2, tags: [tag1, tag2, tag3]);
    await repository!.add(product6);

    // When
    final List<Product> response = await repository!.getRecomended();

    // CLEAR FROM DB
    await deleteFromApi(response);

    // Then
    expect(response, isNotNull);
    expect(response,
        containsAll([product1, product2, product3, product4, product6]));
  });
}
