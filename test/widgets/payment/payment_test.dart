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
import 'package:fleeque/presentation/main_screen/main_screen.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/bloc/payment_bloc.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/payment_form.dart';
import 'package:fleeque/presentation/main_screen/screens/payment/widgets/order_details_widget.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockPaymentBloc extends MockBloc<PaymentEvent, PaymentState>
    implements PaymentBloc {
  @override
  PaymentState get state => PaymentState(
        orderDetails: [
          OrderDetails(
            influencerName: '',
            orderPrice: 0,
            orderDescription: '',
            userId: '',
            timestamp: Timestamp.now(),
          ),
        ],
      );
}

class FakePaymentBloc extends MockBloc<PaymentEvent, PaymentState>
    implements PaymentBloc {
  @override
  PaymentState get state => const PaymentState(
        orderDetails: [],
      );
}

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
    return Stream.value(
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

void main() {
  final MockNavigatorObserver mockNavigatorObserver = MockNavigatorObserver();
  final MockPaymentBloc mockPaymentBloc = MockPaymentBloc();
  final FakePaymentBloc fakePaymentBloc = FakePaymentBloc();
  final MockGetInfluencersListUseCase mockGetInfluencersListUseCase =
      MockGetInfluencersListUseCase();
  final MockObserveUseCase mockObserveUseCase = MockObserveUseCase();

  tearDown(
    () async {
      await mockPaymentBloc.close();
      await fakePaymentBloc.close();
    },
  );

  getIt.registerSingleton<GetInfluencersListUseCase>(
      mockGetInfluencersListUseCase);

  getIt.registerSingleton<ObserveUseCase>(mockObserveUseCase);

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<PaymentBloc>.value(
        value: mockPaymentBloc,
        child: const PaymentForm(),
      ),
      navigatorObservers: [
        mockNavigatorObserver,
      ],
    );
  }

  testWidgets(
    'Check the navigation to main screen',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            makeTestableWidget(),
          );
          expect(
            find.text('Return to home screen'),
            findsOneWidget,
          );
          await tester.pumpAndSettle(
            const Duration(seconds: 2),
          );
          await tester.tap(
            find.text('Return to home screen'),
          );
          await tester.pumpAndSettle();
          expect(
            find.byType(MainScreen),
            findsOneWidget,
          );
        },
      );
    },
  );

  testWidgets(
    'Check the animation of OrderDetailsWidget widget',
    (WidgetTester tester) async {
      () async {
        await tester.pumpWidget(
          makeTestableWidget(),
        );
        expect(
          find.byType(OrderDetailsWidget),
          findsOneWidget,
        );
        await tester.pumpAndSettle(
          const Duration(seconds: 2),
        );
        expect(
          find.byType(OrderDetailsWidget),
          findsOneWidget,
        );
      };
    },
  );

  testWidgets(
    'Check PaymentForm loading if orderDetails is empty at the moment of widget creation',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<PaymentBloc>.value(
            value: fakePaymentBloc,
            child: const PaymentForm(),
          ),
        ),
      );

      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
      expect(
        find.text('Creating your order...'),
        findsOneWidget,
      );
    },
  );
}
