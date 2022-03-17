import 'package:cake/modules/cake/domain/domain.dart';

abstract class ICakeDatasource {
  Future<List<Cake>> get();
  // Future<List<Cake>> search(String text);
}
