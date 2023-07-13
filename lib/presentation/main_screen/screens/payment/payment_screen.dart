import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_order_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/bloc/payment_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/payment_form.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(
        getOrderUseCase: getIt<GetOrderUseCase>(),
      )..add(
          GetOrderDetailsEvent(),
        ),
      child: const PaymentForm(),
    );
  }
}
