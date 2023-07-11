import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/core_ui/secondary_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryAppBar(title: ''),
      body: Center(
        child: Text(
          'Payment screen',
          style: AppFonts.largeFontPrefsBlack,
        ),
      ),
    );
  }
}
