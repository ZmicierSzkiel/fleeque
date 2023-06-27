import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/presentation/main_screen/screens/about/bloc/about_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/about/widgets/about_form.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutBloc(),
      child: BlocBuilder<AboutBloc, AboutState>(
        builder: (context, state) {
          return const AboutForm();
        },
      ),
    );
  }
}
