// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/presentation/auth/registration/bloc/registration_bloc.dart';

class RegistrationEmailInput extends StatefulWidget {
  final String? Function(String?) validator;
  final String hintText;

  const RegistrationEmailInput({
    Key? key,
    required this.validator,
    required this.hintText,
  }) : super(key: key);

  @override
  State<RegistrationEmailInput> createState() => _RegistrationEmailInputState();
}

class _RegistrationEmailInputState extends State<RegistrationEmailInput> {
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
        onChanged: (value) => context.read<RegistrationBloc>().add(
              RegistrationEmailChangedEvent(
                email: value,
              ),
            ),
      ),
    );
  }
}

class RegistrationPassInput extends StatefulWidget {
  final String? Function(String?) validator;
  final String hintText;
  final bool obscureText;

  const RegistrationPassInput({
    Key? key,
    required this.validator,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<RegistrationPassInput> createState() => _RegistrationPassInputState();
}

class _RegistrationPassInputState extends State<RegistrationPassInput> {
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
        onChanged: (value) => context.read<RegistrationBloc>().add(
              RegistrationPasswordChangedEvent(
                password: value,
              ),
            ),
      ),
    );
  }
}

// class RegistrationConfirmPassInput extends StatefulWidget {
//   final String hintText;
//   final bool obscureText;
//   const RegistrationConfirmPassInput({
//     Key? key,
//     required this.hintText,
//     required this.obscureText,
//   }) : super(key: key);

//   @override
//   State<RegistrationConfirmPassInput> createState() =>
//       _RegistrationConfirmPassInputState();
// }

// class _RegistrationConfirmPassInputState
//     extends State<RegistrationConfirmPassInput> {
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 330,
//       child: TextFormField(
//         autocorrect: false,
//         obscureText: widget.obscureText,
//         controller: _confirmPasswordController,
//         style: AppFonts.smallFontPrefs,
//         decoration: InputDecoration(
//           hintText: widget.hintText,
//         ),
//       ),
//     );
//   }
// }
