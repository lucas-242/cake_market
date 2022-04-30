import 'package:cake/modules/authentication/domain/domain.dart';

abstract class IAuthenticationRepository {
  Future<User> signIn(User user);
  Future<User> signUp(User user);
}
