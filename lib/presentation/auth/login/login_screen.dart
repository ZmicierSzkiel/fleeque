import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/usecases/auth_usecases/login_user_usecase.dart';

import 'package:fleeque/presentation/auth/login/bloc/login_bloc.dart';
import 'package:fleeque/presentation/auth/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginUserUseCase: getIt<LoginUserUseCase>(),
      ),
      child: const LoginForm(),
    );
  }
}
