import 'package:delayed_display/delayed_display.dart';
import 'package:fleeque/presentation/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confirmation_success/confirmation_success.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/domain/entities/order_details.dart';

import 'package:fleeque/presentation/main_screen/screens/payment/bloc/payment_bloc.dart';

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
                    bubbleColors: [
                      Colors.yellow,
                      Colors.green,
                      Colors.red,
                    ],
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
                  DelayedDisplay(
                    delay: const Duration(seconds: 2),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                'Order details:',
                                style: AppFonts.largeFontPrefsWhite,
                              ),
                            ),
                          ),
                          const Text(
                            'Influencer and selected option:',
                            style: AppFonts.mediumFontPrefsWhite,
                          ),
                          const Divider(
                            color: AppColors.primaryColor,
                            thickness: 1.0,
                          ),
                          Text(
                            orderDetails.orderDescription,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            'Price:',
                            style: AppFonts.mediumFontPrefsWhite,
                          ),
                          const Divider(
                            color: AppColors.primaryColor,
                            thickness: 1.0,
                          ),
                          Text(
                            '\$${orderDetails.orderPrice}',
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    AppColors.primaryColor,
                                  ),
                                  minimumSize: MaterialStatePropertyAll(
                                    Size(
                                      MediaQuery.of(context).size.width * 0.7,
                                      MediaQuery.of(context).size.height * 0.07,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const MainScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text(
                                  'Return to home screen',
                                  style: AppFonts.mediumFontPrefsBlack,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
