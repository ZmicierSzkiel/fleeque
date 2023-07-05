import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/user.dart';
import 'package:fleeque/domain/usecases/user_usecases/get_user_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/is_first_launch_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/set_first_launch_usecase.dart';

part 'initial_event.dart';
part 'initial_state.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  final IsFirstLaunchUseCase _isFirstLaunchUseCase;
  final SetFirstLaunchUseCase _setFirstLaunchUseCase;
  final GetUserUseCase _getUserUseCase;

  InitialBloc({
    required IsFirstLaunchUseCase isFirstLaunchUseCase,
    required SetFirstLaunchUseCase setFirstLaunchUseCase,
    required GetUserUseCase getUserUseCase,
  })  : _isFirstLaunchUseCase = isFirstLaunchUseCase,
        _setFirstLaunchUseCase = setFirstLaunchUseCase,
        _getUserUseCase = getUserUseCase,
        super(
          const InitialState(
            isFirstLaunch: null,
            isLoggedIn: false,
          ),
        ) {
    on<IsFirstLaunch>(_handleIsFirstLaunch);
  }

  Future<void> _handleIsFirstLaunch(
    IsFirstLaunch event,
    Emitter<InitialState> emit,
  ) async {
    final User? user = await _getUserUseCase.execute(
      NoParams(),
    );

    if (user == null) {
      final bool? isFirstLaunch = await _isFirstLaunchUseCase.execute(
        NoParams(),
      );
      if (isFirstLaunch == null) {
        await _setFirstLaunchUseCase.execute(
          NoParams(),
        );
      }

      emit(
        state.copyWith(
          isFirstLaunch: true,
          isLoggedIn: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isFirstLaunch: false,
          isLoggedIn: true,
        ),
      );
    }
  }
}
