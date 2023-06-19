import 'package:fleeque/core_ui/constants.dart';
import 'package:flutter/material.dart';

class UserSettingsOptions extends StatelessWidget {
  final String optionTitle;
  final void Function() onPressed;

  const UserSettingsOptions({
    Key? key,
    required this.optionTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                AppColors.textPrimaryColor.withOpacity(0.1),
              ),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                optionTitle,
                style: AppFonts.largeFontPrefsBlack,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
