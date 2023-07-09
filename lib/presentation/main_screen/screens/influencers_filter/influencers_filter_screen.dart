import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers_filter/bloc/influencers_filter_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/influencers_filter_form.dart';

class InfluencersFilterScreen extends StatelessWidget {
  const InfluencersFilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfluencersFilterBloc(
        filterInfluencersListUseCase: getIt<FilterInfluencersListUseCase>(),
        getInfluencersListUseCase: getIt<GetInfluencersListUseCase>(),
        observeUseCase: getIt<ObserveUseCase>(),
      )..add(
          ResetFilterEvent(),
        ),
      child: const InfluencersFilterForm(),
    );
  }
}
