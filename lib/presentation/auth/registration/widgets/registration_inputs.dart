import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/register_inputs.dart';

class RegistrationInputs extends StatelessWidget {
  const RegistrationInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
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
        ],
      ),
    );
  }
}
