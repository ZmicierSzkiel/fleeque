import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/send_order_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers/bloc/influencers_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers/influencers_form.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/influencers_filter_screen.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/influencers_page_screen.dart';

class MockInfluencersBloc extends MockBloc<InfluencersEvent, InfluencersState>
    implements InfluencersBloc {
  @override
  InfluencersState get state => InfluencersState(
        influencers: [
          Influencer(
            name: 'john',
            image: 'image1',
            followers: 1000,
            posts: 1000,
            country: 'USA',
            firstOptionPrice: 30,
            secondOptionPrice: 30,
            extraOptionPrice: 30,
            time: Timestamp.fromDate(
              DateTime(2022),
            ),
          ),
          Influencer(
            name: 'mary',
            image: 'image2',
            followers: 500,
            posts: 500,
            country: 'Netherlands',
            firstOptionPrice: 70,
            secondOptionPrice: 70,
            extraOptionPrice: 70,
            time: Timestamp.fromDate(
              DateTime(2021),
            ),
          ),
        ],
      );
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockGetInfluencersListUseCase extends Mock
    implements GetInfluencersListUseCase {
  @override
  Future<void> execute(NoParams params) {
    return Future<void>.value();
  }
}

class MockObserveUseCase extends Mock implements ObserveUseCase {
  @override
  Stream<List<Influencer>> execute(NoParams params) {
    return Stream<List<Influencer>>.value(
      [
        Influencer(
          name: 'john',
          image: 'image1',
          followers: 1000,
          posts: 1000,
          country: 'USA',
          firstOptionPrice: 30,
          secondOptionPrice: 30,
          extraOptionPrice: 30,
          time: Timestamp.fromDate(
            DateTime(2022),
          ),
        ),
        Influencer(
          name: 'mary',
          image: 'image2',
          followers: 500,
          posts: 500,
          country: 'Netherlands',
          firstOptionPrice: 70,
          secondOptionPrice: 70,
          extraOptionPrice: 70,
          time: Timestamp.fromDate(
            DateTime(2021),
          ),
        ),
      ],
    );
  }
}

class MockSendOrderUseCase extends Mock implements SendOrderUseCase {
  @override
  Future<void> execute(OrderDetails params) {
    return Future<void>.value();
  }
}

void main() {
  final MockInfluencersBloc mockInfluencersBloc = MockInfluencersBloc();
  final MockNavigatorObserver mockNavigationObserver = MockNavigatorObserver();
  final MockGetInfluencersListUseCase mockGetInfluencersListUseCase =
      MockGetInfluencersListUseCase();
  final MockObserveUseCase mockObserveUseCase = MockObserveUseCase();
  final MockSendOrderUseCase mockSendOrderUseCase = MockSendOrderUseCase();

  getIt.registerSingleton<GetInfluencersListUseCase>(
      mockGetInfluencersListUseCase);

  getIt.registerSingleton<ObserveUseCase>(mockObserveUseCase);

  getIt.registerSingleton<SendOrderUseCase>(mockSendOrderUseCase);

  tearDown(
    () async {
      await mockInfluencersBloc.close();
    },
  );

  final List<Influencer> testInfluencers = [
    Influencer(
      name: 'john',
      image: 'image1',
      followers: 1000,
      posts: 1000,
      country: 'USA',
      firstOptionPrice: 30,
      secondOptionPrice: 30,
      extraOptionPrice: 30,
      time: Timestamp.fromDate(
        DateTime(2022),
      ),
    ),
    Influencer(
      name: 'mary',
      image: 'image2',
      followers: 500,
      posts: 500,
      country: 'Netherlands',
      firstOptionPrice: 70,
      secondOptionPrice: 70,
      extraOptionPrice: 70,
      time: Timestamp.fromDate(
        DateTime(2021),
      ),
    ),
  ];

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<InfluencersBloc>.value(
        value: mockInfluencersBloc,
        child: const InfluencersForm(),
      ),
      navigatorObservers: [mockNavigationObserver],
    );
  }

  testWidgets(
    'Check if influencers are displayed correctly in InfluencersList',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            makeTestableWidget(),
          );

          for (final influencer in testInfluencers) {
            expect(
              find.widgetWithText(ListTile, influencer.name),
              findsOneWidget,
            );
            expect(
              find.widgetWithText(ListTile, influencer.followers.toString()),
              findsOneWidget,
            );
            expect(
              find.widgetWithText(ListTile, influencer.posts.toString()),
              findsOneWidget,
            );
            expect(
              find.descendant(
                of: find.widgetWithText(ListTile, influencer.name),
                matching: find.byType(Image),
              ),
              findsOneWidget,
            );
          }
        },
      );
    },
  );

  testWidgets(
    'Check if influencers are displayed correctly in the InfluencerCarousel',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(makeTestableWidget());

          for (final influencer in testInfluencers) {
            expect(
                find.byKey(
                  const Key('influencersScreenInfluencerName'),
                ),
                findsOneWidget);
            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is Image &&
                    widget.image is NetworkImage &&
                    (widget.image as NetworkImage).url == influencer.image,
              ),
              findsOneWidget,
            );
          }
        },
      );
    },
  );

  testWidgets(
    'Check the navigation to InfluencersFilterScreen',
    (WidgetTester tester) async {
      () async {
        await tester.pumpWidget(
          makeTestableWidget(),
        );
        expect(
          find.byType(TextButton),
          findsOneWidget,
        );
        await tester.tap(
          find.byType(TextButton),
        );
        await tester.pumpAndSettle();
        expect(
          find.byType(InfluencersFilterScreen),
          findsOneWidget,
        );
      };
    },
  );

  testWidgets(
    'Check the scrollability of the influencers screen',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(makeTestableWidget());

          final scrollView = find.byType(ListView).first;
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
    },
  );

  testWidgets(
    "Check the navigation from influencer tile to influencer's page",
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(makeTestableWidget());
          expect(
            find.widgetWithText(
              ListTile,
              testInfluencers[0].name,
            ),
            findsOneWidget,
          );
          await tester.tap(
            find.widgetWithText(
              ListTile,
              testInfluencers[0].name,
            ),
          );
          await tester.pumpAndSettle();
          expect(
            find.byType(InfluencersPageScreen),
            findsOneWidget,
          );
        },
      );
    },
  );
}
