import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/repositories/auth_repository.dart';
import 'package:fleeque/domain/usecases/auth_usecases/sign_out_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<void> signOutUser() {
    return Future<void>.value();
  }
}

void main() {
  group(
    'SignOutUserUseCase',
    () {
      late MockAuthRepository mockAuthRepository;
      late SignOutUserUseCase signOutUserUseCase;

      setUp(
        () {
          mockAuthRepository = MockAuthRepository();
          signOutUserUseCase = SignOutUserUseCase(
            repository: mockAuthRepository,
          );
        },
      );

      test(
        'check if user can correctly sign out',
        () async {
          expectLater(
            signOutUserUseCase.execute(NoParams()),
            completes,
          );
        },
      );
    },
  );
}
