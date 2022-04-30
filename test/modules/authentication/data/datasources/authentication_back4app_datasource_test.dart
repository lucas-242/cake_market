import 'package:cake/modules/authentication/data/datasources/authentication_back4app_datasource.dart';
import 'package:cake/modules/authentication/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helper.dart';

void main() {
  late IAuthenticationDatasource _datasource;

  setUp(() {
    setupParseInstance();
    _datasource = AuthenticationBack4AppDatasource();
  });

  group('Sign Up', () {
    test('Should Sign Up', () async {
      const user = User(
        name: 'Test',
        email: 'test@gmail.com',
        password: '123456',
      );

      var userCreated = await _datasource.signUp(user);
      //TODO: should delete user after create
      // _datasource.delete(userCreated);

      // deleteFromApi([ParseObject('User')..objectId = userCreated.id]);

      expect(userCreated.id, isNotEmpty);
      expect(userCreated.password, isEmpty);
    });

    test('Should not Sign Up and throw error', () async {
      const user = User(
        name: 'Test',
        email: 'test@gmail.com',
        password: '',
      );

      expect(_datasource.signUp(user), throwsException);
    });
  });
}
