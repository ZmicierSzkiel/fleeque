import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:fleeque/presentation/main_screen/main_screen_form.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenBloc(),
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          return MainScreenForm(
            selectedIndex: state.selectedIndex,
          );
        },
      ),
    );
  }
}
