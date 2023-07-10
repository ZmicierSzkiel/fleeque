import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/user.dart';
import 'package:fleeque/domain/repositories/user_repository.dart';
import 'package:fleeque/domain/usecases/user_usecases/get_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Future<User?> getUser() {
    return super.noSuchMethod(
      Invocation.method(
        #getUser,
        [],
      ),
      returnValue: Future<User?>.value(),
    );
  }
}

void main() {
  group(
    'GetUserUseCase',
    () {
      late GetUserUseCase getUserUseCase;
      late UserRepository mockUserRepository;

      setUp(
        () {
          mockUserRepository = MockUserRepository();
          getUserUseCase = GetUserUseCase(
            repository: mockUserRepository,
          );
        },
      );

      test(
        'should return user from the repository',
        () async {
          const User user = User(
            id: '1',
            email: 'test@example.com',
          );
          when(mockUserRepository.getUser()).thenAnswer(
            (_) async => user,
          );
          final User? result = await getUserUseCase.execute(NoParams());
          expect(
            result,
            equals(user),
          );
        },
      );
    },
  );
}
