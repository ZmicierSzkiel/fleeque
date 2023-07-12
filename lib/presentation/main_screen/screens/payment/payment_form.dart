import 'package:confirmation_success/confirmation_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/domain/entities/order_details.dart';

import 'package:fleeque/presentation/main_screen/screens/payment/bloc/payment_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/widgets/order_details_widget.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state.orderDetails.isEmpty) {
          return Scaffold(
            backgroundColor: AppColors.textPrimaryColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    child: const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 7.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Creating your order...',
                      style: AppFonts.largeFontPrefsWhite,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        final OrderDetails orderDetails = state.orderDetails[0];
        return Scaffold(
          body: Container(
            color: AppColors.textPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ConfirmationSuccess(
                    reactColor: AppColors.primaryColor,
                    numofBubbles: 40,
                    child: Text(
                      'Success!',
                      style: AppFonts.xLargeFontPrefsBlack,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Your order has been created!',
                        style: AppFonts.largeFontPrefsWhite,
                      ),
                    ),
                  ),
                  OrderDetailsWidget(
                    orderDetails: orderDetails,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
