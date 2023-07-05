import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/presentation/auth/login/bloc/login_bloc.dart';

class EmailInput extends StatefulWidget {
  final String? Function(String?) validator;
  final String hintText;

  const EmailInput({
    Key? key,
    required this.validator,
    required this.hintText,
  }) : super(key: key);

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: TextFormField(
        controller: _emailController,
        validator: widget.validator,
        style: AppFonts.smallFontPrefsBlack,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginEmailChangedEvent(
                email: value,
              ),
            ),
      ),
    );
  }
}

class PassInput extends StatefulWidget {
  final String? Function(String?) validator;
  final String hintText;
  final bool obscureText;

  const PassInput({
    Key? key,
    required this.validator,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<PassInput> createState() => _PassInputState();
}

class _PassInputState extends State<PassInput> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: TextFormField(
        autocorrect: false,
        obscureText: widget.obscureText,
        controller: _passwordController,
        validator: widget.validator,
        style: AppFonts.smallFontPrefsBlack,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginPasswordChangedEvent(
                password: value,
              ),
            ),
      ),
    );
  }
}
