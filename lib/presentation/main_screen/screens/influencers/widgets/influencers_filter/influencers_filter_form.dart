import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/core_ui/secondary_app_bar.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers/bloc/influencers_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers/widgets/influencers_filter/influencer_dropdown_button.dart';

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
      'Select',
      'Newest',
      'Oldest',
    ];
    final List<String> popularityRange = [
      'Select',
      '<100K followers',
      '100K to 500K followers',
      '500K to 1M followers',
      '>1M followers'
    ];
    final List<String> countryRange =
        influencers.map((influencer) => influencer.country).toList();
    countryRange.insert(0, 'Select');

    return BlocProvider(
      create: (context) => InfluencersBloc(
        filterInfluencersListUseCase: FilterInfluencersListUseCase(
          repository: getIt.get<DbRepository>(),
        ),
        getInfluencersListUseCase: GetInfluencersListUseCase(
          repository: getIt.get<DbRepository>(),
        ),
      ),
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
                      filterSelectedValue: state.timeFilter,
                      labelText: 'Time',
                      onChanged: (value) {
                        BlocProvider.of<InfluencersBloc>(context)
                            .add(TimeFilterEvent(value!));
                      },
                    ),
                    InfluencerDropdownButton(
                      filterSelectedValue: state.followersFilter,
                      valueList: popularityRange,
                      labelText: 'Popularity',
                      onChanged: (value) {
                        BlocProvider.of<InfluencersBloc>(context)
                            .add(FollowersFilterEvent(value!));
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
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                          AppColors.primaryColor.withOpacity(0.1),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<InfluencersBloc>(context)
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
                            style: AppFonts.largeFontPrefsBlack,
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<InfluencersBloc>(context).add(
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
      ),
    );
  }
}
