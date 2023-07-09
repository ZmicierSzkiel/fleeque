import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';

import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

import 'package:fleeque/presentation/main_screen/screens/home/bloc/home_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/home/home_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getInfluencersListUseCase: getIt<GetInfluencersListUseCase>(),
        observeUseCase: getIt<ObserveUseCase>(),
      )..add(
          const GetInfluencersEvent(),
        ),
      child: const HomeForm(),
    );
  }
}
