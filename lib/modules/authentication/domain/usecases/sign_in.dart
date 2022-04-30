import 'package:cake/modules/authentication/domain/domain.dart';

class SignIn {
  final IAuthenticationRepository _repository;

  SignIn(this._repository);

  Future<User> call({required String email, required String password}) =>
      _repository.signIn(User(email: email, password: password));
}
