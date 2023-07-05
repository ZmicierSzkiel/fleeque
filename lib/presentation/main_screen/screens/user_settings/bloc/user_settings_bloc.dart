import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/usecases/auth_usecases/sign_out_user_usecase.dart';

part 'user_settings_event.dart';
part 'user_settings_state.dart';

class UserSettingsBloc extends Bloc<UserSettingsEvent, UserSettingsState> {
  final SignOutUserUseCase _signOutUserUseCase;

  UserSettingsBloc({
    required SignOutUserUseCase signOutUserUseCase,
  })  : _signOutUserUseCase = signOutUserUseCase,
        super(
          const UserSettingsState(),
        ) {
    on<SignOutPressedEvent>(_handleSignOutPressedEvent);
  }

  Future<void> _handleSignOutPressedEvent(
    SignOutPressedEvent event,
    Emitter<UserSettingsState> emit,
  ) async {
    await _signOutUserUseCase.execute(NoParams());
  }
}
