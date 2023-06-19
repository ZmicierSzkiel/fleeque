import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/initial/widgets/initial_slide_item.dart';
import 'package:fleeque/presentation/auth/login/login_screen.dart';

class InitialCustomCarousel extends StatelessWidget {
  final List<String> slideTitles;
  final ValueChanged<int> onSlideChanged;
  final int dotsCount;
  final double position;

  const InitialCustomCarousel({
    Key? key,
    required this.slideTitles,
    required this.onSlideChanged,
    required this.dotsCount,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLastSlide = position == dotsCount - 1;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: MediaQuery.of(context).size.aspectRatio,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    viewportFraction: 1.0,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      onSlideChanged(index);
                    },
                  ),
                  items: slideTitles
                      .map((title) => InitialSlideItem(title))
                      .toList(),
                ),
                Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: position,
                    decorator: DotsDecorator(
                      activeColor: AppColors.textPrimaryColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 18.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    style: const ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll(AppColors.textPrimaryColor),
                    ),
                    child: Text(
                      isLastSlide ? 'done'.toUpperCase() : 'skip'.toUpperCase(),
                      style: AppFonts.mediumFontPrefsBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
