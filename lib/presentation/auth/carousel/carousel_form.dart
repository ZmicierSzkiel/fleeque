import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/auth/carousel/bloc/carousel_bloc.dart';
import 'package:fleeque/presentation/auth/carousel/widgets/carousel_slide_item.dart';
import 'package:fleeque/presentation/auth/login/login_screen.dart';

class CarouselForm extends StatelessWidget {
  const CarouselForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselBloc, CarouselState>(
      builder: (context, state) {
        const double dotsCount = 3;
        final bool isLastSlide = state.position == dotsCount - 1;

        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: false,
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      onPageChanged: (
                        int index,
                        CarouselPageChangedReason reason,
                      ) {
                        BlocProvider.of<CarouselBloc>(context).add(
                          GetCurrentSlideEvent(
                            index: index.toDouble(),
                          ),
                        );
                      },
                    ),
                    items: state.slideDescriptionsList
                        .map(
                          (slideTitle) => CarouselSlideItem(
                            slideTitle: slideTitle,
                            slideItemTitle: state.slideItemTitle,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: dotsCount.toInt(),
                position: state.position,
                decorator: DotsDecorator(
                  activeColor: AppColors.textPrimaryColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(
                    18.0,
                    18.0,
                  ),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    AppColors.textPrimaryColor,
                  ),
                ),
                child: Text(
                  isLastSlide ? 'done'.toUpperCase() : 'skip'.toUpperCase(),
                  style: AppFonts.mediumFontPrefsBlack,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        );
      },
    );
  }
}
