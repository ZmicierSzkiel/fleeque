import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:fleeque/presentation/main_screen/main_screen_form.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenBloc(
        observeUseCase: ObserveUseCase(
          repository: getIt.get<DbRepository>(),
        ),
        getInfluencersListUseCase: GetInfluencersListUseCase(
          repository: getIt.get<DbRepository>(),
        ),
      )
        ..add(const GetInfluencersEvent())
        ..add(GetFilteredInfluencersEvent()),
      child: const MainScreenForm(),
    );
  }
}
