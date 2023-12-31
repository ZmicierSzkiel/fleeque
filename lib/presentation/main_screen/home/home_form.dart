import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:fleeque/presentation/main_screen/widgets/influencer_carousel.dart';
import 'package:fleeque/presentation/main_screen/widgets/influencers_list.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          AppColors.textPrimaryColor,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'popular'.toUpperCase(),
                        style: AppFonts.smallFontPrefsWhite,
                      ),
                    ),
                    const Text(
                      'Swipe to explore influencers',
                      style: AppFonts.mediumFontPrefsBlack,
                    ),
                  ],
                ),
              ),
              InfluencerCarousel(
                influencers: state.influencers,
                showDetails: true,
              ),
              InfluencersList(
                influencers: state.influencers,
                length: state.influencers.length,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        AppColors.textPrimaryColor,
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         InfluencersScreen(influencers: state.influencers),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'See more'.toUpperCase(),
                        style: AppFonts.mediumFontPrefsWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
