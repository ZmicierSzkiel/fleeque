import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';

class InitialSlideItem extends StatelessWidget {
  final String title;
  final String slideItemTitle =
      'Create the perfect shoutout to your friends from their favorite influencers';

  const InitialSlideItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                slideItemTitle,
                style: AppFonts.largeFontPrefsBlack,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              title,
              style: AppFonts.mediumFontPrefsBlack,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
