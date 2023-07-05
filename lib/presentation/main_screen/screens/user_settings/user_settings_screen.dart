import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/usecases/auth_usecases/sign_out_user_usecase.dart';

import 'package:fleeque/presentation/main_screen/screens/user_settings/bloc/user_settings_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/user_settings/user_settings_form.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSettingsBloc(
        signOutUserUseCase: getIt<SignOutUserUseCase>(),
      ),
      child: BlocBuilder<UserSettingsBloc, UserSettingsState>(
        builder: (context, state) {
          return const UserSettingsForm();
        },
      ),
    );
  }
}
