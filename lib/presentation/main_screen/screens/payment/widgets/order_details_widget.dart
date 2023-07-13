import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';

import 'package:fleeque/domain/entities/order_details.dart';

import 'package:fleeque/presentation/main_screen/main_screen.dart';

class OrderDetailsWidget extends StatelessWidget {
  final OrderDetails orderDetails;

  const OrderDetailsWidget({
    Key? key,
    required this.orderDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(seconds: 2),
      slidingCurve: Curves.easeInOut,
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
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primaryColor,
                    ),
                    minimumSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width * 0.7,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      (Route<dynamic> route) => false,
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
    );
  }
}
