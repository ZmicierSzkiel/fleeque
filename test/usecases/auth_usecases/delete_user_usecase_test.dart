import 'package:fleeque/domain/repositories/auth_repository.dart';
import 'package:fleeque/domain/usecases/auth_usecases/delete_user_usecase.dart';
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
    'DeleteUserUsecase',
    () {
      late MockAuthRepository mockAuthRepository;
      late DeleteUserUseCase deleteUserUseCase;

      setUp(
        () {
          mockAuthRepository = MockAuthRepository();
          deleteUserUseCase = DeleteUserUseCase(repository: mockAuthRepository);
        },
      );

      test(
        'Check if user data correctly deletes from local storage if user signs out',
        () async {
          expectLater(
            deleteUserUseCase.execute(true),
            completes,
          );
        },
      );
    },
  );
}
