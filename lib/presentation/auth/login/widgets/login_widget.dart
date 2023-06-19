import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/login/bloc/login_bloc.dart';
import 'package:fleeque/presentation/auth/login/widgets/login_form.dart';
import 'package:fleeque/presentation/auth/registration/registration_screen.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Login with your credentials',
                style: AppFonts.largeFontPrefsBlack,
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            LoginForm(),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have an account? ",
                      style: AppFonts.mediumFontPrefsBlack,
                    ),
                    TextSpan(
                      text: "Sign up!",
                      style: AppFonts.mediumFontPrefsRedLink,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
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
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Center(
              child: Text(
                "Forgot password?",
                style: AppFonts.mediumFontPrefsBlack,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              width: 240.0,
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
          ],
        ),
      ),
    );
  }
}
