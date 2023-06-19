import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/register_inputs.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RegistrationEmailInput(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Your email";
              }
              return value;
            },
            hintText: "Email".toUpperCase(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          RegistrationPassInput(
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return value;
            },
            hintText: "Password".toUpperCase(),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
