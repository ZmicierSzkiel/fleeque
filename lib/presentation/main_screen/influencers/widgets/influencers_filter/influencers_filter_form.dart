import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/presentation/main_screen/influencers/bloc/influencers_bloc.dart';
import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/core_ui/secondary_app_bar.dart';
import 'package:fleeque/presentation/main_screen/influencers/widgets/influencers_filter/influencer_dropdown_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfluencersFilterForm extends StatelessWidget {
  final List<Influencer> influencers;

  const InfluencersFilterForm({
    super.key,
    required this.influencers,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> priceRange = [
      'Select',
      '0-10',
      '10-50',
      '50-100',
    ];
    final List<String> dateRange = [
      'Newest',
      'Oldest',
    ];
    final List<String> popularityRange = [
      '<100K followers',
      '100K to 500K followers',
      '500K to 1M followers',
      '>1M followers'
    ];
    final List<String> countryRange =
        influencers.map((influencer) => influencer.country).toList();

    return BlocProvider(
      create: (context) => InfluencersBloc(),
      child: BlocBuilder<InfluencersBloc, InfluencersState>(
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
                      valueList: priceRange,
                      filterSelectedValue: state.priceFilter,
                      labelText: 'Price',
                      onChanged: (value) {
                        BlocProvider.of<InfluencersBloc>(context)
                            .add(PriceFilterEvent(value!));
                      },
                    ),
                    InfluencerDropdownButton(
                      valueList: dateRange,
                      filterSelectedValue: state.dateFilter,
                      labelText: 'Time',
                      onChanged: (value) {
                        BlocProvider.of<InfluencersBloc>(context)
                            .add(DateFilterEvent(value!));
                      },
                    ),
                    InfluencerDropdownButton(
                      filterSelectedValue: state.popularityFilter,
                      valueList: popularityRange,
                      labelText: 'Popularity',
                      onChanged: (value) {
                        BlocProvider.of<InfluencersBloc>(context)
                            .add(PopularityFilterEvent(value!));
                      },
                    ),
                    InfluencerDropdownButton(
                      filterSelectedValue: state.countryFilter,
                      valueList: countryRange,
                      labelText: 'Country',
                      onChanged: (value) {
                        BlocProvider.of<InfluencersBloc>(context)
                            .add(CountryFilterEvent(value!));
                      },
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
                            style: AppFonts.largeFontPrefsBlack,
                          ),
                        ),
                        onPressed: () {
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
      ),
    );
  }
}
