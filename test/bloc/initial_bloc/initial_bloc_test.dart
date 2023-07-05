import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/domain/usecases/user_usecases/get_user_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/is_first_launch_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/set_first_launch_usecase.dart';
import 'package:fleeque/presentation/auth/initial/bloc/initial_bloc.dart';

void main() {
  group(
    'InitialBloc',
    () {
      InitialBloc? initialBloc;

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
          initialBloc?.close();
        },
      );

      test(
        'Emits correct states for IsFirstLaunch event',
        () {
          expect(initialBloc!.state,
              const InitialState(isFirstLaunch: null, isLoggedIn: false));
        },
      );

      blocTest<InitialBloc, InitialState>(
        'Emits correct states for IsFirstLaunch event',
        build: () => initialBloc!,
        act: (bloc) => bloc.add(IsFirstLaunch()),
        expect: () => [
          const InitialState(isFirstLaunch: null, isLoggedIn: false),
          const InitialState(isFirstLaunch: true, isLoggedIn: false),
          const InitialState(isFirstLaunch: false, isLoggedIn: true),
        ],
      );
    },
  );
}

class MockIsFirstLaunchUseCase extends Mock implements IsFirstLaunchUseCase {}

class MockSetFirstLaunchUseCase extends Mock implements SetFirstLaunchUseCase {}

class MockGetUserUseCase extends Mock implements GetUserUseCase {}
