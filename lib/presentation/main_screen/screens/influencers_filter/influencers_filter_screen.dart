import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers_filter/bloc/influencers_filter_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/influencers_filter_form.dart';

class InfluencersFilterScreen extends StatelessWidget {
  final List<Influencer> influencers;

  const InfluencersFilterScreen({
    super.key,
    required this.influencers,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> countryRange =
        influencers.map((influencer) => influencer.country).toList();
    countryRange.insert(0, 'Select');

    return BlocProvider(
      create: (context) => InfluencersFilterBloc(
        filterInfluencersListUseCase: getIt<FilterInfluencersListUseCase>(),
        getInfluencersListUseCase: getIt<GetInfluencersListUseCase>(),
      ),
      child: InfluencersFilterForm(countryRange: countryRange),
    );
  }
}
