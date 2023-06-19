import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/core_ui/secondary_app_bar.dart';

import 'package:fleeque/presentation/auth/login/login_screen.dart';
import 'package:fleeque/presentation/main_screen/user_settings/bloc/user_settings_bloc.dart';
import 'package:fleeque/presentation/main_screen/user_settings/widgets/user_settings_add_picture_button.dart';
import 'package:fleeque/presentation/main_screen/user_settings/widgets/user_settings_options.dart';

class UserSettingsForm extends StatelessWidget {
  const UserSettingsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const SecondaryAppBar(
          title: 'Settings',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UserSettingsAddPictureButton(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context
                      .read<UserSettingsBloc>()
                      .add(const SignOutPressedEvent());
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Sign out',
                  style: AppFonts.mediumFontPrefsBlackLink,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    'Hello,',
                    style: AppFonts.mediumFontPrefsBlack,
                  ),
                  Text(
                    'user_name',
                    style: AppFonts.largeFontPrefsBlack,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            UserSettingsOptions(
              onPressed: () {},
              optionTitle: 'Donate',
            ),
            UserSettingsOptions(
              onPressed: () {},
              optionTitle: 'Account',
            ),
            UserSettingsOptions(
              onPressed: () {},
              optionTitle: 'Orders',
            ),
            UserSettingsOptions(
              onPressed: () {},
              optionTitle: 'Contact',
            ),
            UserSettingsOptions(
              onPressed: () {},
              optionTitle: 'Support',
            ),
          ],
        ),
      ),
    );
  }
}
