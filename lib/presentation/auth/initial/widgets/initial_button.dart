import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/presentation/auth/carousel/carousel_screen.dart';

class InitialButton extends StatelessWidget {
  const InitialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth * 0.5;
    final double buttonHeight = screenWidth * 0.15;

    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.primaryColor,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CarouselScreen(),
            ),
          );
        },
        child: Text(
          'Get started'.toUpperCase(),
          style: AppFonts.mediumFontPrefsBlack,
        ),
      ),
    );
  }
}
