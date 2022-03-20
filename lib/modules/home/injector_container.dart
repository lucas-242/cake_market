import 'package:cake/modules/home/home.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
// Blocs and Cubits
  instance.registerFactory(
    () => HomeBloc(getRecomendedCakes: instance()),
  );
}
