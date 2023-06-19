import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/initial/widgets/initial_carousel.dart';

class InitialButton extends StatelessWidget {
  const InitialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.primaryColor),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InitialCarousel()),
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
