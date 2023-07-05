import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/presentation/auth/carousel/bloc/carousel_bloc.dart';
import 'package:fleeque/presentation/auth/carousel/carousel_form.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselBloc(),
      child: const CarouselForm(),
    );
  }
}
