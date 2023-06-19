import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/presentation/main_screen/main_screen.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;

  const AuthButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        },
        child: Text(
          buttonText.toUpperCase(),
          style: AppFonts.mediumFontPrefsWhite,
        ),
      ),
    );
  }
}
