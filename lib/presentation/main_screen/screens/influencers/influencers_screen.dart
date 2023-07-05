import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers/bloc/influencers_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers/influencers_form.dart';

class InfluencersScreen extends StatelessWidget {
  const InfluencersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfluencersBloc(
        getInfluencersListUseCase: getIt<GetInfluencersListUseCase>(),
        observeUseCase: getIt<ObserveUseCase>(),
      )
        ..add(
          const GetInfluencersEvent(),
        )
        ..add(
          const RenderInfluencersEvent(),
        ),
      child: BlocBuilder<InfluencersBloc, InfluencersState>(
        builder: (context, state) {
          return InfluencersForm(
            influencers: state.influencers,
          );
        },
      ),
    );
  }
}
