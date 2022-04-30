import 'package:cake/modules/authentication/domain/domain.dart';
import 'package:cake/modules/authentication/domain/usecases/sign_up.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_test.mocks.dart';

class AuthenticationRepositoryTest extends Mock
    implements IAuthenticationRepository {}

@GenerateMocks([AuthenticationRepositoryTest])
void main() {
  late SignUp usecase;
  late MockAuthenticationRepositoryTest repository;

  const testUser = User(
    id: '1',
    name: 'Test',
    email: 'test@gmail.com',
    password: '',
    emailVerified: true,
  );

  setUp(() {
    repository = MockAuthenticationRepositoryTest();
    usecase = SignUp(repository);
  });

  test('Should return an entity User', () async {
    when(repository.signUp(any)).thenAnswer((_) async => testUser);
    const String name = 'Test';
    const String email = 'test@gmail.com';
    const String password = '123456';

    final result = await usecase(name: name, email: email, password: password);

    expect(result, testUser);
    verify(repository
        .signUp(const User(name: name, email: email, password: password)));
    verifyNoMoreInteractions(repository);
  });
}
