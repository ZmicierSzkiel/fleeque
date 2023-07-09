import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/core_ui/register_inputs.dart';
import 'package:fleeque/domain/usecases/auth_usecases/login_user_usecase.dart';
import 'package:fleeque/presentation/auth/login/login_screen.dart';
import 'package:fleeque/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:fleeque/presentation/auth/registration/registration_form.dart';

class MockLoginUserUseCase extends Mock implements LoginUserUseCase {}

class MockRegistrationBloc
    extends MockBloc<RegistrationEvent, RegistrationState>
    implements RegistrationBloc {
  @override
  RegistrationState get state => const RegistrationState();
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final MockRegistrationBloc mockRegistrationBloc = MockRegistrationBloc();
  final MockNavigatorObserver mockObserver = MockNavigatorObserver();
  final MockLoginUserUseCase mockLoginUserUseCase = MockLoginUserUseCase();

  getIt.registerSingleton<LoginUserUseCase>(mockLoginUserUseCase);

  tearDown(
    () async {
      await mockRegistrationBloc.close();
    },
  );

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<RegistrationBloc>.value(
        value: mockRegistrationBloc,
        child: const RegistrationForm(),
      ),
      navigatorObservers: [mockObserver],
    );
  }

  testWidgets(
    'Check the navigation to Login screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(),
      );
      expect(
        find.text('Sign in!'),
        findsOneWidget,
      );
      await tester.tap(
        find.text('Sign in!'),
      );
      await tester.pumpAndSettle();
      expect(
        find.byType(LoginScreen),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Check if something was typed in email input',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(),
      );
      expect(
        find.byType(RegistrationEmailInput),
        findsOneWidget,
      );
      await tester.enterText(
        find.byType(RegistrationEmailInput),
        'test@example.com',
      );
      await tester.pump();
      expect(
        find.text('test@example.com'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Check if something was typed in password input',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(),
      );
      expect(
        find.byType(RegistrationPassInput),
        findsOneWidget,
      );
      await tester.enterText(
        find.byType(RegistrationPassInput),
        'password',
      );
      await tester.pump();
      expect(
        find.text('password'),
        findsOneWidget,
      );
    },
  );
}
