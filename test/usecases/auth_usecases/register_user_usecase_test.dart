import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/domain/entities/register_user.dart';
import 'package:fleeque/domain/repositories/auth_repository.dart';
import 'package:fleeque/domain/usecases/auth_usecases/register_user_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<void> registerUser(
    RegisterUserRequest params,
  ) {
    return Future<void>.value();
  }
}

void main() {
  group(
    'RegisterUserUseCase',
    () {
      late MockAuthRepository mockAuthRepository;
      late RegisterUserUseCase registerUserUseCase;

      setUp(
        () {
          mockAuthRepository = MockAuthRepository();
          registerUserUseCase = RegisterUserUseCase(
            repository: mockAuthRepository,
          );
        },
      );

      test(
        'check if user has registered',
        () async {
          const RegisterUserRequest params = RegisterUserRequest(
            email: 'test@example.com',
            password: 'password',
          );

          expectLater(
            registerUserUseCase.execute(params),
            completes,
          );
        },
      );
    },
  );
}
