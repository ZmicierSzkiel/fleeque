import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/usecases/user_usecases/get_user_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/is_first_launch_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/set_first_launch_usecase.dart';

import 'package:fleeque/presentation/auth/initial/bloc/initial_bloc.dart';
import 'package:fleeque/presentation/auth/initial/initial_form.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => InitialBloc(
        isFirstLaunchUseCase: getIt<IsFirstLaunchUseCase>(),
        setFirstLaunchUseCase: getIt<SetFirstLaunchUseCase>(),
        getUserUseCase: getIt<GetUserUseCase>(),
      )..add(
          IsFirstLaunch(),
        ),
      child: const InitialForm(),
    );
  }
}
