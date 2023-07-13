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
import 'package:fleeque/domain/usecases/db_usecases/get_order_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/bloc/influencers_page_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/influencers_page_form.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/widgets/influencers_page_option_tile.dart';

class MockInfluencersPageBloc
    extends MockBloc<InfluencersPageEvent, InfluencersPageState>
    implements InfluencersPageBloc {
  @override
  InfluencersPageState get state => const InfluencersPageState(
        influencers: [],
        selectedOption: '',
        orderDescription: '',
        orderPrice: 10,
        influencerName: '',
      );
}

class MockGetOrderUseCase extends Mock implements GetOrderUseCase {
  @override
  Future<List<OrderDetails>> execute(NoParams params) {
    return Future<List<OrderDetails>>.value([]);
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final MockNavigatorObserver mockNavigatorObserver = MockNavigatorObserver();
  final MockInfluencersPageBloc mockInfluencersPageBloc =
      MockInfluencersPageBloc();
  final MockGetOrderUseCase mockGetOrderUseCase = MockGetOrderUseCase();

  tearDown(
    () async {
      await mockInfluencersPageBloc.close();
    },
  );

  getIt.registerSingleton<GetOrderUseCase>(mockGetOrderUseCase);

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<InfluencersPageBloc>.value(
        value: mockInfluencersPageBloc,
        child: InfluencersPageForm(
          influencer: Influencer(
            country: '',
            name: '',
            image: '',
            followers: 0,
            posts: 0,
            time: Timestamp.now(),
            firstOptionPrice: 0,
            secondOptionPrice: 0,
            extraOptionPrice: 0,
          ),
        ),
      ),
      navigatorObservers: [mockNavigatorObserver],
    );
  }

  testWidgets(
    "Check the scrollability of the influencer's page screen",
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(makeTestableWidget());

          final scrollView = find.byType(InfluencerPageOptionTile).first;
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
}
