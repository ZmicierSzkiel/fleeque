import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/custom_bottom_navigation_bar.dart';

import 'package:fleeque/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/about/about_screen.dart';
import 'package:fleeque/presentation/main_screen/screens/home/home_screen.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers/influencers_screen.dart';
import 'package:fleeque/presentation/main_screen/screens/user_settings/user_settings_screen.dart';

class MainScreenForm extends StatelessWidget {
  final int selectedIndex;

  const MainScreenForm({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          icon: const Icon(Icons.account_circle_outlined),
          tooltip: 'Open user account',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserSettingsScreen(),
              ),
            );
          },
        ),
        title: Image.asset('assets/images/logo_min.png'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_balance_wallet_outlined),
            tooltip: 'Open your wallet',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: selectedIndex == 1
          ? const InfluencersScreen()
          : selectedIndex == 2
              ? const AboutScreen()
              : const HomeScreen(),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          BlocProvider.of<MainScreenBloc>(context).add(
            ItemTappedEvent(index),
          );
        },
      ),
    );
  }
}
