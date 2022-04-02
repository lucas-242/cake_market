import 'package:cake/modules/cake/domain/domain.dart';

class SearchCakes {
  final ICakeRepository _cakeRepository;

  SearchCakes({required ICakeRepository cakeRepository})
      : _cakeRepository = cakeRepository;

  Future<List<Cake>> call(String text) {
    return _cakeRepository.search(text);
  }
}
