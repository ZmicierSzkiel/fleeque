import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/login/login_screen.dart';
import 'package:fleeque/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:fleeque/presentation/auth/registration/widgets/registration_form.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Register your account',
              style: AppFonts.largeFontPrefsBlack,
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          const RegistrationForm(),
          const SizedBox(
            height: 30.0,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Already have an account? ",
                    style: AppFonts.mediumFontPrefsBlack,
                  ),
                  TextSpan(
                    text: "Sign in!",
                    style: AppFonts.mediumFontPrefsRedLink,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                  ),
                ],
              ),
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
                    .read<RegistrationBloc>()
                    .add(const RegistrationButtonPressedEvent());
              },
              child: Text(
                "Register".toUpperCase(),
                style: AppFonts.mediumFontPrefsWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
