import 'package:fleeque/core/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/domain/repositories/user_repository.dart';
import 'package:fleeque/domain/usecases/user_usecases/get_user_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/is_first_launch_usecase.dart';
import 'package:fleeque/domain/usecases/user_usecases/set_first_launch_usecase.dart';

import 'package:fleeque/presentation/main_screen/main_screen.dart';
import 'package:fleeque/presentation/auth/initial/bloc/initial_bloc.dart';
import 'package:fleeque/presentation/auth/initial/widgets/initial_button.dart';
import 'package:fleeque/presentation/auth/login/login_screen.dart';

class Initial extends StatelessWidget {
  const Initial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialBloc(
        isFirstLaunchUseCase: IsFirstLaunchUseCase(
          repository: getIt.get<UserRepository>(),
        ),
        setFirstLaunchUseCase: SetFirstLaunchUseCase(
          repository: getIt.get<UserRepository>(),
        ),
        getUserUseCase: GetUserUseCase(
          repository: getIt.get<UserRepository>(),
        ),
      )..add(IsFirstLaunch()),
      child: Scaffold(
        body: BlocBuilder<InitialBloc, InitialState>(
          builder: (context, state) {
            if (state.isFirstLaunch == null) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover,
                      colorFilter: AppColors.initialPageColor),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Center(
                      child: Text(
                        'Welcome to',
                        style: AppFonts.xLargeFontPrefsWhite,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 80),
                          child: InitialButton(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state.isLoggedIn) {
              return const MainScreen();
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
