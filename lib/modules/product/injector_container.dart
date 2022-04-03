import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/product/data/datasources/product_back4app_datasource.dart';
import 'package:cake/modules/product/data/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
// Blocs and Cubits
  instance.registerFactory(
    () => ProductBloc(getProducts: instance()),
  );

  // Use Cases
  instance
      .registerLazySingleton(() => GetProducts(productRepository: instance()));
  instance.registerLazySingleton(
      () => GetRecomendedProducts(productRepository: instance()));
  instance.registerLazySingleton(
      () => SearchProducts(productRepository: instance()));

  // Repositories
  instance.registerLazySingleton<IProductRepository>(
      () => ProductRepository(datasource: instance()));

  // Datasources
  instance.registerLazySingleton<IProductDatasource>(
      () => ProductBack4AppDatasource());
}
