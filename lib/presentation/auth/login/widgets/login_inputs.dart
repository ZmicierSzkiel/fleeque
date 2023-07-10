import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/login_inputs.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmailInput(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }
            return value;
          },
          hintText: "Email".toUpperCase(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        PassInput(
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
    );
  }
}
