import 'package:cake/modules/authentication/domain/domain.dart';

class SignUp {
  final IAuthenticationRepository repository;

  SignUp(this.repository);

  Future<User> call({
    required String name,
    required String email,
    required String password,
  }) =>
      repository.signUp(User(name: name, email: email, password: password));
}
