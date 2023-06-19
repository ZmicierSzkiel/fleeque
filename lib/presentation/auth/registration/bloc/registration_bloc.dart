import 'package:bloc/bloc.dart';

import 'package:fleeque/domain/entities/register_user.dart';
import 'package:fleeque/domain/usecases/auth_usecases/register_user_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUserUseCase _registerUserUseCase;
  RegistrationBloc({required RegisterUserUseCase registerUserUseCase})
      : _registerUserUseCase = registerUserUseCase,
        super(const RegistrationState()) {
    on<RegistrationButtonPressedEvent>(
        _handleRegistrationWithEmailAndPasswordEvent);
    on<RegistrationEmailChangedEvent>(_handleRegistrationEmailChangedEvent);
    on<RegistrationPasswordChangedEvent>(
        _handleRegistrationPasswordChangedEvent);
  }

  Future<void> _handleRegistrationWithEmailAndPasswordEvent(
      RegistrationButtonPressedEvent event,
      Emitter<RegistrationState> emit) async {
    try {
      final RegisterUserRequest registerUserRequest =
          RegisterUserRequest(email: state.email, password: state.password);
      await _registerUserUseCase.execute(registerUserRequest);
      emit(state.copyWith(
          message: "Success", status: RegistrationStatus.success));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: RegistrationStatus.failure));
    }
  }

  Future<void> _handleRegistrationEmailChangedEvent(
    RegistrationEmailChangedEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleRegistrationPasswordChangedEvent(
    RegistrationPasswordChangedEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }
}
