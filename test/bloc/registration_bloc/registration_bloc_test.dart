import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/domain/entities/register_user.dart';
import 'package:fleeque/domain/usecases/auth_usecases/register_user_usecase.dart';
import 'package:fleeque/presentation/auth/registration/bloc/registration_bloc.dart';

class MockRegisterUserUseCase extends Mock implements RegisterUserUseCase {
  @override
  Future<void> execute(RegisterUserRequest params) async {
    return Future.value();
  }
}

void main() {
  group(
    'RegisterBloc',
    () {
      late RegisterUserUseCase mockRegisterUserUseCase;
      late RegistrationBloc registrationBloc;

      setUp(
        () {
          mockRegisterUserUseCase = MockRegisterUserUseCase();
          registrationBloc = RegistrationBloc(
            registerUserUseCase: mockRegisterUserUseCase,
          );
        },
      );

      tearDown(
        () {
          registrationBloc.close();
        },
      );

      blocTest<RegistrationBloc, RegistrationState>(
        'emits RegistrationState.success when registration is successful',
        build: () => registrationBloc,
        act: (bloc) {
          bloc.add(
            const RegistrationEmailChangedEvent(email: 'test@example.com'),
          );
          bloc.add(
            const RegistrationPasswordChangedEvent(password: 'password'),
          );
          bloc.add(
            const RegistrationButtonPressedEvent(),
          );
        },
        expect: () => [
          const RegistrationState(
            email: 'test@example.com',
            password: 'password',
            message: 'Success',
            status: RegistrationStatus.success,
          ),
        ],
        skip: 2,
      );

      blocTest<RegistrationBloc, RegistrationState>(
        'emits RegistrationState(email: "test@example.com") when RegistrationEmailChangedEvent is added',
        build: () => registrationBloc,
        act: (bloc) => bloc.add(
          const RegistrationEmailChangedEvent(email: 'test@example.com'),
        ),
        expect: () => [
          const RegistrationState(
            email: 'test@example.com',
          ),
        ],
      );

      blocTest<RegistrationBloc, RegistrationState>(
        'emits RegistrationState(password: "password") when RegistrationPasswordChangedEvent is added',
        build: () => registrationBloc,
        act: (bloc) => bloc.add(
          const RegistrationPasswordChangedEvent(password: 'password'),
        ),
        expect: () => [
          const RegistrationState(
            password: 'password',
          ),
        ],
      );
    },
  );
}
