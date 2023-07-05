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
  Stream<List<Influencer>> execute(NoParams params) async* {
    yield [
      Influencer(
        name: 'name',
        image: 'image',
        followers: 0,
        posts: 0,
        country: 'country',
        price: 0,
        time: Timestamp.fromDate(DateTime.utc(2021)),
      ),
    ];
  }
}

void main() {
  group(
    'HomeBloc',
    () {
      late HomeBloc homeBloc;
      late MockGetInfluencersListUseCase mockGetInfluencersListUseCase;
      late MockObserveUseCase mockObserveUseCase;

      setUp(
        () {
          mockGetInfluencersListUseCase = MockGetInfluencersListUseCase();
          mockObserveUseCase = MockObserveUseCase();
          homeBloc = HomeBloc(
            getInfluencersListUseCase: mockGetInfluencersListUseCase,
            observeUseCase: mockObserveUseCase,
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

      blocTest<HomeBloc, HomeState>(
        'Emits correct states for GetInfluencersEvent',
        build: () => homeBloc,
        act: (bloc) {
          bloc.add(const GetInfluencersEvent());
        },
        expect: () => [],
      );

      blocTest<HomeBloc, HomeState>(
        'Emits correct states for RenderInfluencersEvent',
        build: () => homeBloc,
        act: (bloc) {
          bloc.add(
            const RenderInfluencersEvent(),
          );
        },
        expect: () => [
          HomeState(
            influencers: [
              Influencer(
                name: 'name',
                image: 'image',
                followers: 0,
                posts: 0,
                country: 'country',
                price: 0,
                time: Timestamp.fromDate(DateTime.utc(2021)),
              )
            ],
          ),
        ],
      );
    },
  );
}
