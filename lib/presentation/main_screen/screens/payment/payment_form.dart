import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/core_ui/secondary_app_bar.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: ''),
      body: Container(
        color: AppColors.textPrimaryColor,
        child: const Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Success!',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
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
