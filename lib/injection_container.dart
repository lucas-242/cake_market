import 'package:cake/modules/app/app.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(() => AppBloc());
  // await login.init();
  // await books.init();
  // await search.init();

  //! Core
  // instance.registerLazySingleton<CacheClient>(() => CacheClientImpl());
}
