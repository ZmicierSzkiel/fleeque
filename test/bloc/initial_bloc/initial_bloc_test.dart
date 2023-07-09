import 'package:bloc_test/bloc_test.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/domain/usecases/user_usecases/get_user_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/is_first_launch_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/set_first_launch_usecase.dart';
import 'package:fleeque/presentation/auth/initial/bloc/initial_bloc.dart';

class MockIsFirstLaunchUseCase extends Mock implements IsFirstLaunchUseCase {
  @override
  Future<bool?> execute(NoParams params) async {
    return true;
  }
}

class MockSetFirstLaunchUseCase extends Mock implements SetFirstLaunchUseCase {
  @override
  Future<void> execute(NoParams params) async {}
}

class MockGetUserUseCase extends Mock implements GetUserUseCase {
  @override
  Future<User?> execute(NoParams params) async {
    return const User(email: '', id: '');
  }
}

void main() {
  group(
    'InitialBloc',
    () {
      late InitialBloc initialBloc;

      setUp(
        () {
          initialBloc = InitialBloc(
            isFirstLaunchUseCase: MockIsFirstLaunchUseCase(),
            setFirstLaunchUseCase: MockSetFirstLaunchUseCase(),
            getUserUseCase: MockGetUserUseCase(),
          );
        },
      );

      tearDown(
        () {
          initialBloc.close();
        },
      );

      blocTest(
        'Emits correct states for IsFirstLaunch event',
        build: () => initialBloc,
        act: (bloc) => bloc.add(
          IsFirstLaunch(),
        ),
        expect: () => [
          const InitialState(isFirstLaunch: false, isLoggedIn: true),
        ],
      );

      blocTest<InitialBloc, InitialState>(
        'Emits correct states for IsFirstLaunch event',
        build: () => initialBloc,
        act: (bloc) => bloc.add(
          IsFirstLaunch(),
        ),
        expect: () => [
          const InitialState(isFirstLaunch: false, isLoggedIn: true),
        ],
      );
    },
  );
}
