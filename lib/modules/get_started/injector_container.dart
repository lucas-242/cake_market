import 'package:cake/modules/get_started/get_started.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  // Blocs and Cubits
  instance.registerFactory(() => GetStartedCubit());
}
