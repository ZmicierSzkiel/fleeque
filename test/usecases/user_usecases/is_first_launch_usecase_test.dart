import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/usecases/user_usecases/is_first_launch_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/domain/repositories/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Future<bool?> isFirstLaunch() {
    return super.noSuchMethod(
      Invocation.method(
        #isFirstLaunch,
        [],
      ),
      returnValue: Future<bool?>.value(),
    );
  }
}

void main() {
  group(
    'IsFirstLaunchUseCase',
    () {
      late MockUserRepository mockUserRepository;
      late IsFirstLaunchUseCase isFirstLaunchUseCase;

      setUp(
        () {
          mockUserRepository = MockUserRepository();
          isFirstLaunchUseCase = IsFirstLaunchUseCase(
            repository: mockUserRepository,
          );
        },
      );

      test(
        'should return true if it is the first launch',
        () async {
          const bool isFirstLaunch = false;
          when(mockUserRepository.isFirstLaunch())
              .thenAnswer((_) async => isFirstLaunch);

          final result = await isFirstLaunchUseCase.execute(NoParams());

          expect(result, isFirstLaunch);
        },
      );
    },
  );
}
