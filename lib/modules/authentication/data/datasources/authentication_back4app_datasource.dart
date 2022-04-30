import 'package:cake/core/models/models.dart';
import 'package:cake/modules/authentication/domain/domain.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AuthenticationBack4AppDatasource implements IAuthenticationDatasource {
  @override
  Future<User> signIn(User user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<User> signUp(User user) async {
    try {
      final userToCreate =
          ParseUser.createUser(user.email, user.password, user.email)
            ..set('name', user.name);
      final response = await userToCreate.signUp();

      if (!response.success) {
        throw ServerException(
            'Erro ao tentar efetuar o registro do usuário: ${response.error?.message}');
      }

      final userCreated = response.result as ParseUser;
      final result = User(
        id: userCreated.objectId!,
        name: userCreated.get('name'),
        email: userCreated.emailAddress!,
        emailVerified: userCreated.emailVerified ?? false,
      );

      //* Used to avoid user login automatically
      // await userToCreate.logout();

      return result;
    } catch (error) {
      throw ServerException(
          'Erro ao tentar efetuar o registro do usuário: $error');
    }
  }

  @override
  Future<void> delete(User user) async {
    try {
      // QueryBuilder<ParseObject> query =
      //     QueryBuilder<ParseObject>(ParseObject('User'))
      //       ..whereEqualTo('objectId', user.id);

      // // final  ParseObject userToDelete = await
      // final apiResponse = await query.query();
      // if (!apiResponse.success && apiResponse.results == null) {
      //   throw ServerException(
      //       'Erro ao tentar deletar o usuário: ${apiResponse.error?.message}');
      // }

      // final ParseObject userToDelete = apiResponse.result as ParseObject;
      final ParseUser userToDelete = await ParseUser.currentUser();
      // final response = await userToDelete.destroy();
      await userToDelete.destroy();
    } catch (error) {
      throw ServerException('Erro ao tentar deletar o usuário: $error');
    }
  }
}
