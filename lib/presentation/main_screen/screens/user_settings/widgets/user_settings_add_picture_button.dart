import 'package:fleeque/core_ui/constants.dart';
import 'package:flutter/material.dart';

class UserSettingsAddPictureButton extends StatefulWidget {
  const UserSettingsAddPictureButton({super.key});

  @override
  State<UserSettingsAddPictureButton> createState() =>
      _UserSettingsAddPictureButtonState();
}

class _UserSettingsAddPictureButtonState
    extends State<UserSettingsAddPictureButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
            AppColors.textPrimaryColor.withOpacity(0.1),
          ),
        ),
        onPressed: () {},
        child:
            const Text('Add picture', style: AppFonts.mediumFontPrefsBlackLink),
      ),
    );
  }
}
