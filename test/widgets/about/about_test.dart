import 'package:fleeque/presentation/main_screen/screens/about/about_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget() {
    return const MaterialApp(
      home: AboutForm(),
    );
  }

  testWidgets(
    'check the scrollability of about screen ',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      final scrollView = find.byType(Column).first;
      final initialPosition = tester.getTopLeft(scrollView);

      await tester.drag(
        scrollView,
        const Offset(0, -300),
      );
      await tester.pumpAndSettle();

      final scrolledPosition = tester.getTopLeft(scrollView);

      expect(
        scrolledPosition,
        isNot(
          equals(initialPosition),
        ),
      );
    },
  );
}
