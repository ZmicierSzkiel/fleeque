import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/repositories/auth_repository.dart';
import 'package:fleeque/domain/usecases/auth_usecases/register_user_usecase.dart';

import 'package:fleeque/presentation/main_screen/main_screen.dart';
import 'package:fleeque/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:fleeque/presentation/auth/registration/widgets/registration_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(
        registerUserUseCase: RegisterUserUseCase(
          repository: getIt.get<AuthRepository>(),
        ),
      ),
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          return BlocListener<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              if (state.status == RegistrationStatus.success) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              } else if (state.status == RegistrationStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: const RegistrationWidget(),
          );
        },
      ),
    );
  }
}
