import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/usecases/auth_usecases/sign_out_user_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/user_settings/bloc/user_settings_bloc.dart';

class MockSignOutUserUseCase extends Mock implements SignOutUserUseCase {
  @override
  Future<void> execute(NoParams params) async {
    return Future.value();
  }
}

void main() {
  group('UserSettingsBloc', () {
    late UserSettingsBloc userSettingsBloc;
    late MockSignOutUserUseCase mockSignOutUserUseCase;

    setUp(() {
      mockSignOutUserUseCase = MockSignOutUserUseCase();
      userSettingsBloc =
          UserSettingsBloc(signOutUserUseCase: mockSignOutUserUseCase);
    });

    tearDown(() {
      userSettingsBloc.close();
    });

    blocTest<UserSettingsBloc, UserSettingsState>(
      'SignOutPressedEvent triggers UserSettingsState',
      build: () => userSettingsBloc,
      act: (bloc) => bloc.add(const SignOutPressedEvent()),
      verify: (_) {
        mockSignOutUserUseCase.execute(NoParams());
      },
    );
  });
}
