import 'package:cake/modules/cake/domain/domain.dart';

class GetRecomendedCakes {
  final ICakeRepository _cakeRepository;
  GetRecomendedCakes({required ICakeRepository cakeRepository})
      : _cakeRepository = cakeRepository;

  Future<List<Cake>> call() async {
    return await _cakeRepository.getRecomended();
  }
}
