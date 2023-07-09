import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/domain/entities/login_user.dart';
import 'package:fleeque/domain/usecases/auth_usecases/login_user_usecase.dart';
import 'package:fleeque/presentation/auth/login/bloc/login_bloc.dart';

class MockLoginUserUseCase extends Mock implements LoginUserUseCase {
  @override
  Future<void> execute(LoginUserRequest params) async {
    return Future.value();
  }
}

void main() {
  group(
    'LoginBloc',
    () {
      late LoginUserUseCase loginUserUseCase;
      late LoginBloc loginBloc;

      setUp(
        () {
          loginUserUseCase = MockLoginUserUseCase();
          loginBloc = LoginBloc(loginUserUseCase: loginUserUseCase);
        },
      );

      tearDown(
        () {
          loginBloc.close();
        },
      );

      blocTest<LoginBloc, LoginState>(
        'emits LoginState.success when login is successful',
        build: () => loginBloc,
        act: (bloc) {
          bloc.add(
            const LoginEmailChangedEvent(email: 'test@example.com'),
          );
          bloc.add(
            const LoginPasswordChangedEvent(password: 'password'),
          );
          bloc.add(
            const LoginButtonPressedEvent(),
          );
        },
        expect: () => [
          const LoginState(
            email: 'test@example.com',
            password: 'password',
            message: 'Success',
            status: LoginStatus.success,
          ),
        ],
        skip: 2,
      );

      blocTest<LoginBloc, LoginState>(
        'emits LoginState(email: "test@example.com") when LoginEmailChangedEvent is added',
        build: () => loginBloc,
        act: (bloc) => bloc.add(
          const LoginEmailChangedEvent(email: 'test@example.com'),
        ),
        expect: () => [
          const LoginState(
            email: 'test@example.com',
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits LoginState(password: "password") when LoginPasswordChangedEvent is added',
        build: () => loginBloc,
        act: (bloc) => bloc.add(
          const LoginPasswordChangedEvent(password: 'password'),
        ),
        expect: () => [
          const LoginState(
            password: 'password',
          ),
        ],
      );
    },
  );
}
