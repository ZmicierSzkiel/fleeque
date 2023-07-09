import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers/bloc/influencers_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/influencers_filter_screen.dart';
import 'package:fleeque/presentation/main_screen/widgets/influencer_carousel.dart';
import 'package:fleeque/presentation/main_screen/widgets/influencers_list.dart';

class InfluencersForm extends StatelessWidget {
  const InfluencersForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfluencersBloc, InfluencersState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20.0,
                      0.0,
                      20.0,
                      20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Influencers',
                          style: AppFonts.largeFontPrefsBlack,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            iconColor: const MaterialStatePropertyAll(
                              AppColors.textPrimaryColor,
                            ),
                            overlayColor: MaterialStatePropertyAll(
                              AppColors.textPrimaryColor.withOpacity(0.1),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InfluencersFilterScreen(),
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.tune,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Filter',
                                style: AppFonts.mediumFontPrefsBlack,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InfluencerCarousel(
                    influencers: state.influencers,
                    showDetails: false,
                  ),
                  InfluencersList(
                    influencers: state.influencers,
                    length: state.influencers.length,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.textPrimaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 30.0),
                        child: Text(
                          'if you dont find your influencer, just let us know and we will make sure they join Fleeque soon'
                              .toUpperCase(),
                          style: AppFonts.smallFontPrefsWhite,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
