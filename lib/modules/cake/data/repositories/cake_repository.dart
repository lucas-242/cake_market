import 'package:cake/modules/cake/domain/domain.dart';

class CakeRepository extends ICakeRepository {
  final ICakeDatasource _datasource;

  CakeRepository({required ICakeDatasource datasource})
      : _datasource = datasource;

  @override
  Future<List<Cake>> get() => _datasource.get();

  @override
  Future<List<Cake>> getRecomended() => _datasource.getRecomended();

  @override
  Future<List<Cake>> search(String text) => _datasource.search(text);
}
