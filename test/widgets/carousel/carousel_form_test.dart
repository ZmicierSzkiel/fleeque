import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fleeque/presentation/auth/carousel/bloc/carousel_bloc.dart';
import 'package:fleeque/presentation/auth/carousel/carousel_form.dart';

void main() {
  testWidgets(
    'CarouselForm displays correct slide title',
    (WidgetTester tester) async {
      final carouselBloc = CarouselBloc();
      carouselBloc.emit(
        const CarouselState(
          slideDescriptionsList: ['Slide 1', 'Slide 2', 'Slide 3'],
          slideItemTitle: 'Slide Item',
          position: 1,
        ),
      );

      await tester.pumpWidget(
        BlocProvider.value(
          value: carouselBloc,
          child: const MaterialApp(
            home: CarouselForm(),
          ),
        ),
      );

      expect(find.text('Slide 1'), findsOneWidget);
    },
  );
}
