import 'package:cake/modules/cake/cake.dart';
import 'package:cake/modules/cake/data/datasources/cake_firebase_datasource.dart';
import 'package:cake/modules/cake/data/repositories/cake_repository.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
// Blocs and Cubits
  instance.registerFactory(
    () => CakeBloc(getCakes: instance()),
  );

  // Use Cases
  instance.registerLazySingleton(() => GetCakes(cakeRepository: instance()));
  instance.registerLazySingleton(
      () => GetRecomendedCakes(cakeRepository: instance()));

  // Repositories
  instance.registerLazySingleton<ICakeRepository>(
      () => CakeRepository(datasource: instance()));

  // Datasources
  instance
      .registerLazySingleton<ICakeDatasource>(() => CakeFirebaseDatasource());
}
