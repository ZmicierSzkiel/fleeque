import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/login/bloc/login_bloc.dart';
import 'package:fleeque/presentation/auth/login/widgets/login_inputs.dart';
import 'package:fleeque/presentation/auth/registration/registration_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Login with your credentials',
                style: AppFonts.largeFontPrefsBlack,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: LoginInputs(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: AppFonts.mediumFontPrefsBlack,
                ),
                TextButton(
                  child: const Text(
                    "Sign up!",
                    style: AppFonts.mediumFontPrefsRedLink,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const Text(
              "Forgot password?",
              style: AppFonts.mediumFontPrefsBlack,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFc33294),
                      Color(0xFF714aac),
                    ],
                    stops: [
                      0.19,
                      0.9951,
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    context
                        .read<LoginBloc>()
                        .add(const LoginButtonPressedEvent());
                  },
                  child: Text(
                    'Login'.toUpperCase(),
                    style: AppFonts.mediumFontPrefsWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
