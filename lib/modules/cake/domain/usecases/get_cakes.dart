import 'package:cake/modules/cake/domain/domain.dart';

class GetCakes {
  final ICakeRepository _cakeRepository;
  GetCakes({required ICakeRepository cakeRepository})
      : _cakeRepository = cakeRepository;

  Future<List<Cake>> call() async {
    return await _cakeRepository.get();
  }
}
