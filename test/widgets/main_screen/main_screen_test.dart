import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/domain/usecases/auth_usecases/sign_out_user_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:fleeque/presentation/main_screen/main_screen_form.dart';
import 'package:fleeque/presentation/main_screen/screens/user_settings/user_settings_screen.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockMainScreenBloc extends MockBloc<MainScreenEvent, MainScreenState>
    implements MainScreenBloc {
  @override
  MainScreenState get state => const MainScreenState();
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
    return Stream.value(
      [
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
}

class MockSignOutUserUseCase extends Mock implements SignOutUserUseCase {}

void main() {
  final MockMainScreenBloc mockMainScreenBloc = MockMainScreenBloc();
  final MockNavigatorObserver mockObserver = MockNavigatorObserver();
  final MockGetInfluencersListUseCase mockGetInfluencersListUseCase =
      MockGetInfluencersListUseCase();
  final MockObserveUseCase mockObserveUseCase = MockObserveUseCase();
  final MockSignOutUserUseCase mockSignOutUserUseCase =
      MockSignOutUserUseCase();

  getIt.registerSingleton<GetInfluencersListUseCase>(
      mockGetInfluencersListUseCase);

  getIt.registerSingleton<ObserveUseCase>(mockObserveUseCase);

  getIt.registerSingleton<SignOutUserUseCase>(mockSignOutUserUseCase);

  tearDown(
    () async {
      await mockMainScreenBloc.close();
    },
  );

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<MainScreenBloc>.value(
        value: mockMainScreenBloc,
        child: const MainScreenForm(),
      ),
      navigatorObservers: [mockObserver],
    );
  }

  testWidgets(
    'Check if account button opens user settings screen',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(makeTestableWidget());

          expect(
            find.byIcon(Icons.account_circle_outlined).first,
            findsOneWidget,
          );

          await tester.tap(find.byIcon(Icons.account_circle_outlined).first);
          await tester.pumpAndSettle();

          expect(
            find.byType(UserSettingsScreen),
            findsOneWidget,
          );
        },
      );
    },
  );

  testWidgets(
    'Check if wallet button does nothing when pressed',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(makeTestableWidget());

          expect(
            find.byIcon(Icons.account_balance_wallet_outlined).first,
            findsOneWidget,
          );

          await tester
              .tap(find.byIcon(Icons.account_balance_wallet_outlined).first);
          await tester.pumpAndSettle();
        },
      );
    },
  );

  testWidgets(
    'Check if info button does nothing when pressed',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(makeTestableWidget());

          expect(
            find.byIcon(Icons.info_outline).first,
            findsOneWidget,
          );

          await tester.tap(find.byIcon(Icons.info_outline).first);
          await tester.pumpAndSettle();
        },
      );
    },
  );
}
