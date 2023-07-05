import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fleeque/presentation/main_screen/bloc/main_screen_bloc.dart';

void main() {
  group(
    'MainScreenBloc',
    () {
      late MainScreenBloc mainScreenBloc;

      setUp(
        () {
          mainScreenBloc = MainScreenBloc();
        },
      );

      tearDown(
        () {
          mainScreenBloc.close();
        },
      );

      test('Initial state should be correct', () {
        expect(
          mainScreenBloc.state,
          equals(
            const MainScreenState(
              selectedIndex: 0,
            ),
          ),
        );
      });

      blocTest<MainScreenBloc, MainScreenState>(
        'Emits correct states for ItemTappedEvent',
        build: () => mainScreenBloc,
        act: (bloc) => bloc.add(
          const ItemTappedEvent(
            index: 2,
          ),
        ),
        expect: () => [
          const MainScreenState(selectedIndex: 2),
        ],
      );
    },
  );
}
