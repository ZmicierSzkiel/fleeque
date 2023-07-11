import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/domain/entities/influencer.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers_page/bloc/influencers_page_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/widgets/influencers_page_option_tile.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/payment_screen.dart';

class InfluencersPageForm extends StatelessWidget {
  final Influencer influencer;

  const InfluencersPageForm({
    super.key,
    required this.influencer,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfluencersPageBloc, InfluencersPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 100,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
                elevation: const MaterialStatePropertyAll(
                  0,
                ),
              ),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
              ),
              label: const Text(
                'Back',
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_outline,
                  color: AppColors.primaryColor,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(
                    influencer.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          influencer.name,
                          style: AppFonts.xLargeFontPrefsBlack,
                        ),
                        influencer.followers > 1000
                            ? Text(
                                '${(influencer.followers * 0.001)}M followers',
                                style: AppFonts.mediumFontPrefsBlack,
                              )
                            : Text(
                                '${influencer.followers}K followers',
                                style: AppFonts.mediumFontPrefsBlack,
                              ),
                        Text(
                          '${influencer.posts} posts',
                          style: AppFonts.mediumFontPrefsBlack,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  child: Column(
                    children: [
                      InfluencerPageOptionTile(
                        influencer: influencer,
                        price: influencer.firstOptionPrice,
                        description:
                            '${influencer.name} will upload a video on her story tagging your friend',
                        option: 'Option 1',
                        selectedOption: state.selectedOption,
                      ),
                      InfluencerPageOptionTile(
                        influencer: influencer,
                        price: influencer.secondOptionPrice,
                        description:
                            '${influencer.name} will send a video to your friends Instagram inbox',
                        option: 'Option 2',
                        selectedOption: state.selectedOption,
                      ),
                      InfluencerPageOptionTile(
                        influencer: influencer,
                        price: influencer.extraOptionPrice,
                        description:
                            '${influencer.name} will send the videos via email',
                        option: 'Extra',
                        selectedOption: state.selectedOption,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.textPrimaryColor,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (state.orderPrice != 0) {
                            BlocProvider.of<InfluencersPageBloc>(context).add(
                              SubmitOrderEvent(),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentScreen(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 60.0,
                          ),
                          child: Text(
                            'Next'.toUpperCase(),
                          ),
                        ),
                      ),
                      Align(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Total',
                              style: AppFonts.mediumFontPrefsBlack,
                            ),
                            Text(
                              '\$${state.orderPrice}',
                              style: AppFonts.xLargeFontPrefsBlack,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
