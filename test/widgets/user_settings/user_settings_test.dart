import 'package:bloc_test/bloc_test.dart';
import 'package:fleeque/core/app_locator.dart';
import 'package:fleeque/domain/usecases/auth_usecases/login_user_usecase.dart';
import 'package:fleeque/presentation/auth/login/login_screen.dart';
import 'package:fleeque/presentation/main_screen/screens/user_settings/bloc/user_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fleeque/presentation/main_screen/screens/user_settings/user_settings_form.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockLoginUserUseCase extends Mock implements LoginUserUseCase {}

class MockUserSettingsBloc
    extends MockBloc<UserSettingsEvent, UserSettingsState>
    implements UserSettingsBloc {
  @override
  UserSettingsState get state => const UserSettingsState();
}

void main() {
  final MockUserSettingsBloc mockUserSettingsBloc = MockUserSettingsBloc();
  final mockLoginUserUseCase = MockLoginUserUseCase();

  getIt.registerSingleton<LoginUserUseCase>(mockLoginUserUseCase);

  tearDown(
    () async {
      await mockUserSettingsBloc.close();
    },
  );

  testWidgets(
    'Check the navigation to LoginScreen',
    (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<UserSettingsBloc>.value(
            value: mockUserSettingsBloc,
            child: const UserSettingsForm(),
          ),
          navigatorObservers: [mockObserver],
        ),
      );
      expect(
        find.text('Sign out'),
        findsOneWidget,
      );
      await tester.tap(
        find.text('Sign out'),
      );
      await tester.pumpAndSettle();
      expect(
        find.byType(LoginScreen),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'UserSettingsForm displays sign out button',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserSettingsForm(),
        ),
      );

      expect(
        find.text('Sign out'),
        findsOneWidget,
      );
    },
  );
}
