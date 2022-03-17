import 'package:cake/modules/cake/cake.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
// Blocs and Cubits
  instance.registerFactory(
    () => CakeBloc(getCakes: instance()),
  );
}
