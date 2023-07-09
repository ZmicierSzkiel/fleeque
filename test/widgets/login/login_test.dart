import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/core_ui/login_inputs.dart';
import 'package:fleeque/domain/usecases/auth_usecases/register_user_usecase.dart';
import 'package:fleeque/presentation/auth/login/bloc/login_bloc.dart';
import 'package:fleeque/presentation/auth/login/login_form.dart';
import 'package:fleeque/presentation/auth/registration/registration_screen.dart';

class MockRegisterUserUseCase extends Mock implements RegisterUserUseCase {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {
  @override
  LoginState get state => const LoginState();
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final MockLoginBloc mockLoginBloc = MockLoginBloc();
  final MockNavigatorObserver mockObserver = MockNavigatorObserver();
  final MockRegisterUserUseCase mockRegisterUserUseCase =
      MockRegisterUserUseCase();

  getIt.registerSingleton<RegisterUserUseCase>(mockRegisterUserUseCase);

  tearDown(
    () async {
      await mockLoginBloc.close();
    },
  );

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<LoginBloc>.value(
        value: mockLoginBloc,
        child: const LoginForm(),
      ),
      navigatorObservers: [mockObserver],
    );
  }

  testWidgets(
    'Check the navigation to Registration screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestableWidget(),
      );
      expect(
        find.text('Sign up!'),
        findsOneWidget,
      );
      await tester.tap(
        find.text('Sign up!'),
      );
      await tester.pumpAndSettle();
      expect(
        find.byType(RegistrationScreen),
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
        find.byType(EmailInput),
        findsOneWidget,
      );
      await tester.enterText(
        find.byType(EmailInput),
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
        find.byType(PassInput),
        findsOneWidget,
      );
      await tester.enterText(
        find.byType(PassInput),
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
