import 'package:bloc_test/bloc_test.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/widgets/influencer_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers_filter/bloc/influencers_filter_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/influencers_filter_form.dart';

class MockInfluencersFilterBloc
    extends MockBloc<InfluencersFilterEvent, InfluencersFilterState>
    implements InfluencersFilterBloc {
  @override
  InfluencersFilterState get state => const InfluencersFilterState(
        priceFilter: '',
        countryFilter: '',
        followersFilter: '',
        timeFilter: '',
        priceRange: [
          'Select',
          '0-10',
          '10-50',
          '50-100',
        ],
        timeRange: [
          'Select',
          'Newest',
          'Oldest',
        ],
        followersRange: [
          'Select',
          '<100K followers',
          '100K to 500K followers',
          '500K to 1M followers',
          '>1M followers'
        ],
        influencers: [],
      );
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  MockInfluencersFilterBloc mockInfluencersFilterBloc =
      MockInfluencersFilterBloc();

  tearDown(
    () async {
      await mockInfluencersFilterBloc.close();
    },
  );

  testWidgets(
    'Check the navigation by pressing back button in app bar',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          final mockObserver = MockNavigatorObserver();
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<InfluencersFilterBloc>.value(
                value: mockInfluencersFilterBloc,
                child: const InfluencersFilterForm(),
              ),
              navigatorObservers: [mockObserver],
            ),
          );
          expect(
            find.text('Back'),
            findsOneWidget,
          );
          await tester.tap(
            find.text('Back'),
          );
          await tester.pumpAndSettle();
          // verify(
          //   mockObserver.didPop(any, any),
          // );
        },
      );
    },
  );

  testWidgets(
    'Check the navigation by pressing reset sorting button',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          final mockObserver = MockNavigatorObserver();
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<InfluencersFilterBloc>.value(
                value: mockInfluencersFilterBloc,
                child: const InfluencersFilterForm(),
              ),
              navigatorObservers: [mockObserver],
            ),
          );
          expect(
            find.text('Reset sorting'),
            findsOneWidget,
          );
          await tester.tap(
            find.text('Reset sorting'),
          );
          await tester.pumpAndSettle();
        },
      );
    },
  );

  testWidgets(
    'Check the navigation by pressing filter button',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          final mockObserver = MockNavigatorObserver();
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<InfluencersFilterBloc>.value(
                value: mockInfluencersFilterBloc,
                child: const InfluencersFilterForm(),
              ),
              navigatorObservers: [mockObserver],
            ),
          );
          expect(
            find.byType(ElevatedButton),
            findsOneWidget,
          );
          await tester.tap(
            find.byType(ElevatedButton),
          );
          await tester.pumpAndSettle();
        },
      );
    },
  );

  testWidgets(
    'Check if price dropdownButton is working properly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<InfluencersFilterBloc>.value(
            value: mockInfluencersFilterBloc,
            child: const InfluencersFilterForm(),
          ),
        ),
      );

      final dropdownButton = find.byWidgetPredicate(
        (widget) =>
            widget is InfluencerDropdownButton && widget.labelText == 'Price',
      );
      await tester.tap(dropdownButton);
      await tester.pumpAndSettle();

      expect(
        find.text('0-10'),
        findsOneWidget,
      );
      expect(
        find.text('10-50'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Check if time dropdownButton is working properly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<InfluencersFilterBloc>.value(
            value: mockInfluencersFilterBloc,
            child: const InfluencersFilterForm(),
          ),
        ),
      );

      final dropdownButton = find.byWidgetPredicate(
        (widget) =>
            widget is InfluencerDropdownButton && widget.labelText == 'Time',
      );
      await tester.tap(dropdownButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Newest'),
        findsOneWidget,
      );
      expect(
        find.text('Oldest'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Check if populatity dropdownButton is working properly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<InfluencersFilterBloc>.value(
            value: mockInfluencersFilterBloc,
            child: const InfluencersFilterForm(),
          ),
        ),
      );

      final dropdownButton = find.byWidgetPredicate(
        (widget) =>
            widget is InfluencerDropdownButton &&
            widget.labelText == 'Popularity',
      );
      await tester.tap(dropdownButton);
      await tester.pumpAndSettle();

      expect(
        find.text('<100K followers'),
        findsOneWidget,
      );
    },
  );
}
