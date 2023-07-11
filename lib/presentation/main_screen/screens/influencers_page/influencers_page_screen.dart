import 'package:fleeque/domain/usecases/db_usecases/send_order_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers_page/bloc/influencers_page_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/influencers_page_form.dart';

class InfluencersPageScreen extends StatelessWidget {
  final Influencer influencer;

  const InfluencersPageScreen({
    super.key,
    required this.influencer,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => InfluencersPageBloc(
        getInfluencersListUseCase: getIt<GetInfluencersListUseCase>(),
        observeUseCase: getIt<ObserveUseCase>(),
        sendOrderUseCase: getIt<SendOrderUseCase>(),
      )..add(
          const GetInfluencersEvent(),
        ),
      child: InfluencersPageForm(
        influencer: influencer,
      ),
    );
  }
}
