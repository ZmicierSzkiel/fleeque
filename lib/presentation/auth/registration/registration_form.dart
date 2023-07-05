import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/login/login_screen.dart';
import 'package:fleeque/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:fleeque/presentation/auth/registration/widgets/registration_inputs.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Text(
              'Register your account',
              style: AppFonts.largeFontPrefsBlack,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: RegistrationInputs(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: AppFonts.mediumFontPrefsBlack,
              ),
              TextButton(
                child: const Text(
                  "Sign in!",
                  style: AppFonts.mediumFontPrefsRedLink,
                ),
                onPressed: () {
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
                      .read<RegistrationBloc>()
                      .add(const RegistrationButtonPressedEvent());
                },
                child: Text(
                  "Register".toUpperCase(),
                  style: AppFonts.mediumFontPrefsWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
