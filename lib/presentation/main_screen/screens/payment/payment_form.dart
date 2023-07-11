import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/core_ui/secondary_app_bar.dart';

import 'package:fleeque/domain/entities/order_details.dart';

import 'package:fleeque/presentation/main_screen/screens/payment/bloc/payment_bloc.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state.orderDetails.isEmpty) {
          return const CircularProgressIndicator();
        }
        final OrderDetails orderDetails = state.orderDetails[0];
        return Scaffold(
          appBar: const SecondaryAppBar(title: ''),
          body: Container(
            color: AppColors.textPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Success!',
                      style: AppFonts.xLargeFontPrefsWhite,
                    ),
                  ),
                  const Text(
                    'Your order has been placed.',
                    style: AppFonts.mediumFontPrefsWhite,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your order is: ',
                        style: AppFonts.largeFontPrefsWhite,
                      ),
                    ),
                  ),
                  Text(
                    '${orderDetails.orderDescription} with price \$${orderDetails.orderPrice.toString()}',
                    style: AppFonts.mediumFontPrefsWhite,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
