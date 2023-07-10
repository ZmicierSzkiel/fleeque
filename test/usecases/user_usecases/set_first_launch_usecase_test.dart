import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/repositories/user_repository.dart';
import 'package:fleeque/domain/usecases/user_usecases/set_first_launch_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Future<void> setFirstLaunch() {
    return Future.value();
  }
}

void main() {
  group(
    'SetFirstLaunchUseCase',
    () {
      late SetFirstLaunchUseCase setFirstLaunchUseCase;
      late UserRepository mockUserRepository;

      setUp(
        () {
          mockUserRepository = MockUserRepository();
          setFirstLaunchUseCase = SetFirstLaunchUseCase(
            repository: mockUserRepository,
          );
        },
      );

      test(
        'Should set the first launch when user entered the app',
        () async {
          expectLater(
            setFirstLaunchUseCase.execute(NoParams()),
            completes,
          );
        },
      );
    },
  );
}
