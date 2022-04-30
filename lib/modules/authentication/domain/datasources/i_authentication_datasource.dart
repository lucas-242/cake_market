import 'package:cake/modules/authentication/domain/domain.dart';

abstract class IAuthenticationDatasource {
  Future<void> delete(User user);
  Future<User> signIn(User user);
  Future<User> signUp(User user);
}
