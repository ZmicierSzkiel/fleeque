import 'package:flutter/material.dart';

import 'package:fleeque/presentation/auth/initial/widgets/initial_custom_carousel_widget.dart';

class InitialCarousel extends StatefulWidget {
  const InitialCarousel({Key? key}) : super(key: key);

  @override
  State<InitialCarousel> createState() => _InitialCarouselState();
}

class _InitialCarouselState extends State<InitialCarousel> {
  double _currentSlide = 0;
  List<String> slideTitlesList = [
    'Is it your friends birthday and you want to get her something unforgettable. Why not buy her a birthday greeting from her favorite influencer?',
    'Is your friend getting married and you want to send her a little extra special wedding wish? Who better than her favorite celebrity?',
    'Have you dreamt about appearing on the instagram story of your favorite influencer, why not buy a shoutout on her story tagging you for the world to see?'
  ];

  @override
  Widget build(BuildContext context) {
    return InitialCustomCarousel(
      slideTitles: slideTitlesList,
      onSlideChanged: (index) {
        setState(() {
          _currentSlide = index.toDouble();
        });
      },
      dotsCount: 3,
      position: _currentSlide,
    );
  }
}
