import 'package:flutter/widgets.dart';

import 'package:fleeque/core_ui/constants.dart';

class CarouselSlideItem extends StatelessWidget {
  final String slideTitle;
  final String slideItemTitle;

  const CarouselSlideItem({
    Key? key,
    required this.slideTitle,
    required this.slideItemTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            slideTitle,
            style: AppFonts.mediumFontPrefsBlack,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
