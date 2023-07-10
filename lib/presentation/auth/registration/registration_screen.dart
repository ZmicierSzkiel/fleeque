import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/usecases/auth_usecases/register_user_usecase.dart';

import 'package:fleeque/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:fleeque/presentation/auth/registration/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(
        registerUserUseCase: getIt<RegisterUserUseCase>(),
      ),
      child: const RegistrationForm(),
    );
  }
}
