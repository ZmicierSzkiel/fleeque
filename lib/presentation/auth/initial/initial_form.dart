import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/initial/bloc/initial_bloc.dart';
import 'package:fleeque/presentation/auth/initial/widgets/initial_button.dart';
import 'package:fleeque/presentation/auth/login/login_screen.dart';
import 'package:fleeque/presentation/main_screen/main_screen.dart';

class InitialForm extends StatelessWidget {
  const InitialForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialBloc, InitialState>(
      builder: (context, state) {
        return Scaffold(
            body:
                // state.isFirstLaunch == null
                //     ?
                Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
              colorFilter: AppColors.initialPageColor,
            ),
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
        )
            // : state.isLoggedIn
            //     ? const MainScreen()
            //     : const LoginScreen(),
            );
      },
    );
  }
}
