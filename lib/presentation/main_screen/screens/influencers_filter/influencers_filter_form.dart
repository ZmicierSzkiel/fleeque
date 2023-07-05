// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/core_ui/secondary_app_bar.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/bloc/influencers_filter_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/widgets/influencer_dropdown_button.dart';

class InfluencersFilterForm extends StatelessWidget {
  final List<String> countryRange;

  const InfluencersFilterForm({
    Key? key,
    required this.countryRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfluencersFilterBloc, InfluencersFilterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const SecondaryAppBar(
            title: '',
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: AppColors.textPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                    child: const Text(
                      'Sort by',
                      style: AppFonts.largeFontPrefsWhite,
                    ),
                  ),
                  InfluencerDropdownButton(
                    valueList: state.priceRange,
                    filterSelectedValue: state.priceFilter,
                    labelText: 'Price',
                    onChanged: (value) {
                      BlocProvider.of<InfluencersFilterBloc>(context)
                          .add(PriceFilterEvent(value!));
                    },
                  ),
                  InfluencerDropdownButton(
                    valueList: state.timeRange,
                    filterSelectedValue: state.timeFilter,
                    labelText: 'Time',
                    onChanged: (value) {
                      BlocProvider.of<InfluencersFilterBloc>(context)
                          .add(TimeFilterEvent(value!));
                    },
                  ),
                  InfluencerDropdownButton(
                    filterSelectedValue: state.followersFilter,
                    valueList: state.followersRange,
                    labelText: 'Popularity',
                    onChanged: (value) {
                      BlocProvider.of<InfluencersFilterBloc>(context)
                          .add(FollowersFilterEvent(value!));
                    },
                  ),
                  InfluencerDropdownButton(
                    filterSelectedValue: state.countryFilter,
                    valueList: countryRange,
                    labelText: 'Country',
                    onChanged: (value) {
                      BlocProvider.of<InfluencersFilterBloc>(context)
                          .add(CountryFilterEvent(value!));
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(
                        AppColors.primaryColor.withOpacity(0.1),
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<InfluencersFilterBloc>(context)
                          .add(ResetFilterEvent());
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Reset sorting',
                      style: AppFonts.mediumFontPrefsWhiteLink,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            AppColors.primaryColor),
                        minimumSize: const MaterialStatePropertyAll(
                          Size(
                            double.infinity,
                            0,
                          ),
                        ),
                        overlayColor: MaterialStatePropertyAll(
                          AppColors.textPrimaryColor.withOpacity(0.1),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Filter'.toUpperCase(),
                          style: AppFonts.mediumFontPrefsBlack,
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<InfluencersFilterBloc>(context).add(
                          FilterDataEvent(),
                        );
                        Navigator.pop(context);
                      },
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
