import 'package:cake/modules/cake/domain/domain.dart';

abstract class ICakeRepository {
  Future<List<Cake>> get();
  // Future<List<Cake>> search(String text);
}
