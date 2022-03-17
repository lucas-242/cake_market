import 'package:cake/modules/app/app.dart';
import 'package:cake/modules/get_started/injector_container.dart'
    as get_started;
import 'package:cake/modules/cake/inject_container.dart' as cake;
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(() => AppBloc());
  await get_started.init();
  await cake.init();

  //! Core
  // instance.registerLazySingleton<CacheClient>(() => CacheClientImpl());
}
