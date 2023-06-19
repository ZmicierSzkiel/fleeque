import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/login_inputs.dart';

class LoginForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
            padding: EdgeInsets.all(8.0),
          ),
          const SizedBox(
            height: 20.0,
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
      ),
    );
  }
}
