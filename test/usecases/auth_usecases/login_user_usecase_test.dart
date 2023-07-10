import 'package:fleeque/domain/entities/login_user.dart';
import 'package:fleeque/domain/repositories/auth_repository.dart';
import 'package:fleeque/domain/usecases/auth_usecases/login_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<void> logInUser(LoginUserRequest params) {
    return Future<void>.value();
  }
}

void main() {
  group(
    'LoginUserUseCase',
    () {
      late MockAuthRepository mockAuthRepository;
      late LoginUserUseCase loginUserUseCase;

      setUp(
        () {
          mockAuthRepository = MockAuthRepository();
          loginUserUseCase = LoginUserUseCase(
            repository: mockAuthRepository,
          );
        },
      );
      test(
        'check if user can correctly log in',
        () async {
          const LoginUserRequest params = LoginUserRequest(
            email: 'test@example.com',
            password: 'password',
          );

          expectLater(
            loginUserUseCase.execute(params),
            completes,
          );
        },
      );
    },
  );
}
