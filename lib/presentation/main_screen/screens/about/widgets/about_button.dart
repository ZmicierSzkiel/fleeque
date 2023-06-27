import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';

class AboutButton extends StatelessWidget {
  final String title;

  const AboutButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              AppColors.textPrimaryColor,
            ),
            overlayColor: MaterialStatePropertyAll(
              AppColors.primaryColor.withOpacity(0.1),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          onPressed: () {},
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
              title.toUpperCase(),
              style: AppFonts.mediumFontPrefsWhite,
            ),
          ),
        ),
      ),
    );
  }
}
