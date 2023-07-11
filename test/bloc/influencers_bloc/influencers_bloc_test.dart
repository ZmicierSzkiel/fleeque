import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers/bloc/influencers_bloc.dart';

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
    'InfluencersBloc',
    () {
      late InfluencersBloc influencersBloc;

      setUp(
        () {
          influencersBloc = InfluencersBloc(
            getInfluencersListUseCase: MockGetInfluencersListUseCase(),
            observeUseCase: MockObserveUseCase(),
          );
        },
      );

      tearDown(
        () {
          influencersBloc.close();
        },
      );

      test(
        'Initial state should be correct',
        () {
          expect(
            influencersBloc.state,
            equals(
              const InfluencersState(influencers: []),
            ),
          );
        },
      );

      blocTest(
        'Emits correct state for GetInfluencersEvent',
        build: () => influencersBloc,
        act: (bloc) => bloc.add(const GetInfluencersEvent()),
        expect: () => [],
      );

      blocTest<InfluencersBloc, InfluencersState>(
        'Emits correct states for RenderInfluencersEvent',
        build: () => influencersBloc,
        act: (bloc) {
          bloc.add(
            const RenderInfluencersEvent(
              influencers: [],
            ),
          );
        },
        expect: () => [
          const InfluencersState(
            influencers: [],
          ),
        ],
      );

      blocTest<InfluencersBloc, InfluencersState>(
        'Emits correct state and cancels/disposes the stream when closed',
        build: () => influencersBloc,
        act: (bloc) => bloc.close(),
        expect: () => [],
      );
    },
  );
}
