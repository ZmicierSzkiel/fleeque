import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fleeque/domain/entities/login_user.dart';
import 'package:fleeque/domain/usecases/auth_usecases/login_user_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase _loginUserUseCase;

  LoginBloc({
    required LoginUserUseCase loginUserUseCase,
  })  : _loginUserUseCase = loginUserUseCase,
        super(const LoginState()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);
    on<LoginEmailChangedEvent>(_handleLoginEmailChangedEvent);
    on<LoginPasswordChangedEvent>(_handleLoginPasswordChangedEvent);
  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final LoginUserRequest loginUserRequest = LoginUserRequest(
        email: state.email,
        password: state.password,
      );
      await _loginUserUseCase.execute(loginUserRequest);
      emit(
        state.copyWith(
          message: "Success",
          status: LoginStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: e.toString(),
          status: LoginStatus.failure,
        ),
      );
    }
  }

  Future<void> _handleLoginEmailChangedEvent(
    LoginEmailChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  Future<void> _handleLoginPasswordChangedEvent(
    LoginPasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
}
