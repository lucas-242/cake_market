import 'package:cake/modules/authentication/domain/domain.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationDatasource _datasource;

  AuthenticationRepository({required IAuthenticationDatasource datasource})
      : _datasource = datasource;

  @override
  Future<User> signIn(User user) => _datasource.signIn(user);

  @override
  Future<User> signUp(User user) => _datasource.signUp(user);
}
