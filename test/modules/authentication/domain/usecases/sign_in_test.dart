import 'package:cake/modules/authentication/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_test.mocks.dart';

class AuthenticationRepositoryTest extends Mock
    implements IAuthenticationRepository {}

@GenerateMocks([AuthenticationRepositoryTest])
void main() {
  late SignIn usecase;
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
    usecase = SignIn(repository);
  });

  test('Should return an entity User', () async {
    when(repository.signIn(any)).thenAnswer((_) async => testUser);
    const String email = 'test@gmail.com';
    const String password = '123456';

    final result = await usecase(email: email, password: password);

    expect(result, testUser);
    verify(repository.signIn(const User(email: email, password: password)));
    verifyNoMoreInteractions(repository);
  });
}
