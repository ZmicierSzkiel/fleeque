import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fleeque/core_ui/custom_bottom_navigation_bar.dart';

void main() {
  testWidgets(
    'CustomBottomNavigationBar displays correct items and handles tap',
    (WidgetTester tester) async {
      int selectedIndex = 0;
      void handleTap(int index) {
        selectedIndex = index;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: selectedIndex,
              onTap: handleTap,
            ),
          ),
        ),
      );

      expect(
        find.text('Home'),
        findsOneWidget,
      );
      expect(
        find.text('Influencer'),
        findsOneWidget,
      );
      expect(
        find.text('About'),
        findsOneWidget,
      );

      await tester.tap(
        find.byIcon(Icons.star_border_outlined),
      );
      await tester.pumpAndSettle();

      expect(
        selectedIndex,
        equals(1),
      );
    },
  );
}
