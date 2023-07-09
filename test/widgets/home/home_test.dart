import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:fleeque/domain/entities/influencer.dart';

import 'package:fleeque/presentation/main_screen/screens/home/bloc/home_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/home/home_form.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {
  @override
  HomeState get state => HomeState(
        influencers: [
          Influencer(
            name: 'john',
            image: 'image1',
            followers: 1000,
            posts: 1000,
            country: 'USA',
            price: 30,
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
            price: 70,
            time: Timestamp.fromDate(
              DateTime(2021),
            ),
          ),
        ],
      );
}

void main() {
  final MockHomeBloc mockHomeBloc = MockHomeBloc();

  tearDown(
    () async {
      await mockHomeBloc.close();
    },
  );

  final List<Influencer> testInfluencers = [
    Influencer(
      name: 'john',
      image: 'image1',
      followers: 1000,
      posts: 1000,
      country: 'USA',
      price: 30,
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
      price: 70,
      time: Timestamp.fromDate(
        DateTime(2021),
      ),
    ),
  ];

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<HomeBloc>.value(
        value: MockHomeBloc(),
        child: const HomeForm(),
      ),
    );
  }

  testWidgets(
    'Check if influencers are displayed correctly in the InfluencersList',
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
                  const Key('homeScreenInfluencerName'),
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
}
