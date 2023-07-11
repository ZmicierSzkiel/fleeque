// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/bloc/influencers_page_bloc.dart';

class InfluencerPageOptionTile extends StatelessWidget {
  final Influencer influencer;
  final String description;
  final String option;
  final String selectedOption;
  final int price;

  const InfluencerPageOptionTile({
    Key? key,
    required this.influencer,
    required this.description,
    required this.option,
    required this.selectedOption,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<InfluencersPageBloc>(context).add(
          OptionTappedEvent(
            option: option,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: option == selectedOption
                ? AppColors.textPrimaryColor
                : AppColors.primaryColor,
            border: Border.all(
              color: AppColors.textPrimaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      description,
                      style: option == selectedOption
                          ? const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: AppColors.primaryColor,
                            )
                          : const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: AppColors.textPrimaryColor,
                            ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      option,
                      style: option == selectedOption
                          ? AppFonts.mediumFontPrefsWhite
                          : AppFonts.mediumFontPrefsBlack,
                    ),
                    Text(
                      '\$${price.toString()}',
                      style: option == selectedOption
                          ? AppFonts.largeFontPrefsWhite
                          : AppFonts.largeFontPrefsBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
