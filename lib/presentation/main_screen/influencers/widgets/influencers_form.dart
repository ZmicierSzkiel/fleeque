import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/domain/entities/influencer.dart';

import 'package:fleeque/presentation/main_screen/widgets/influencer_carousel.dart';
import 'package:fleeque/presentation/main_screen/widgets/influencers_list.dart';
import 'package:fleeque/presentation/main_screen/influencers/widgets/influencers_filter/influencers_filter_form.dart';

class InfluencersForm extends StatelessWidget {
  final List<Influencer> influencers;

  const InfluencersForm({
    super.key,
    required this.influencers,
  });

  @override
  Widget build(BuildContext context) {
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
                            builder: (context) => InfluencersFilterForm(
                              influencers: influencers,
                            ),
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
                influencers: influencers,
                showDetails: false,
              ),
              InfluencersList(
                influencers: influencers,
                length: influencers.length,
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
  }
}
