import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/home/bloc/home_bloc.dart';

class MockGetInfluencersListUseCase extends Mock
    implements GetInfluencersListUseCase {
  @override
  Future<void> execute(NoParams params) async {}
}

class MockObserveUseCase extends Mock implements ObserveUseCase {
  @override
  Stream<List<Influencer>> execute(NoParams params) {
    return Stream.value(
      [
        Influencer(
          name: 'name',
          image: 'image',
          followers: 0,
          posts: 0,
          country: 'country',
          firstOptionPrice: 0,
          secondOptionPrice: 0,
          extraOptionPrice: 0,
          time: Timestamp.fromDate(DateTime.utc(2021)),
        )
      ],
    );
  }
}

void main() {
  group(
    'HomeBloc',
    () {
      late HomeBloc homeBloc;

      setUp(
        () {
          homeBloc = HomeBloc(
            getInfluencersListUseCase: MockGetInfluencersListUseCase(),
            observeUseCase: MockObserveUseCase(),
          );
        },
      );

      tearDown(
        () {
          homeBloc.close();
        },
      );

      test(
        'Initial state should be correct',
        () {
          expect(
            homeBloc.state,
            equals(
              const HomeState(
                influencers: [],
              ),
            ),
          );
        },
      );

      blocTest(
        'Emits correct state for GetInfluencersEvent',
        build: () => homeBloc,
        act: (bloc) => bloc.add(const GetInfluencersEvent()),
        expect: () => [],
      );

      blocTest<HomeBloc, HomeState>(
        'Emits correct states for RenderInfluencersEvent',
        build: () => homeBloc,
        act: (bloc) {
          bloc.add(
            const RenderInfluencersEvent(
              influencers: [],
            ),
          );
        },
        expect: () => [
          const HomeState(
            influencers: [],
          ),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'Emits correct state and cancels/disposes the stream when closed',
        build: () => homeBloc,
        act: (bloc) => bloc.close(),
        expect: () => [],
      );
    },
  );
}
