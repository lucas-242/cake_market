import 'package:cake/modules/app/app.dart';
import 'package:cake/modules/get_started/injector_container.dart'
    as get_started;
import 'package:cake/modules/cake/injector_container.dart' as cake;
import 'package:cake/modules/home/injector_container.dart' as home;
import 'package:cake/modules/search/injector_container.dart' as search;
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(() => AppBloc());
  await get_started.init();
  await cake.init();
  await home.init();
  await search.init();

  //! Core
  // instance.registerLazySingleton<CacheClient>(() => CacheClientImpl());
}
