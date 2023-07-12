import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/send_order_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_page/bloc/influencers_page_bloc.dart';

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

class MockSendOrderUseCase extends Mock implements SendOrderUseCase {
  @override
  Future<void> execute(OrderDetails params) async {
    return Future<void>.value();
  }
}

void main() {
  group(
    'InfluencersPageBloc',
    () {
      late InfluencersPageBloc influencersPageBloc;

      setUp(
        () {
          influencersPageBloc = InfluencersPageBloc(
            getInfluencersListUseCase: MockGetInfluencersListUseCase(),
            observeUseCase: MockObserveUseCase(),
            sendOrderUseCase: MockSendOrderUseCase(),
          );
        },
      );

      tearDown(
        () async {
          await influencersPageBloc.close();
        },
      );

      test(
        'Initial state should be empty',
        () {
          expect(
            influencersPageBloc.state,
            equals(
              const InfluencersPageState(
                influencers: [],
                selectedOption: '',
                orderDescription: '',
                influencerName: '',
                orderPrice: 0,
              ),
            ),
          );
        },
      );

      blocTest<InfluencersPageBloc, InfluencersPageState>(
        'Emits correct state for GetInfluencersEvent',
        build: () => influencersPageBloc,
        act: (bloc) => bloc.add(
          const GetInfluencersEvent(),
        ),
        expect: () => [],
      );

      blocTest<InfluencersPageBloc, InfluencersPageState>(
        'Emits correct state for RenderInfluencersEvent',
        build: () => influencersPageBloc,
        act: (bloc) => bloc.add(
          const RenderInfluencersEvent(
            influencers: [],
          ),
        ),
        expect: () => [
          const InfluencersPageState(
            influencers: [],
            selectedOption: '',
            orderDescription: '',
            influencerName: '',
            orderPrice: 0,
          )
        ],
      );

      blocTest(
        'Emits correct state for OptionTappedEvent',
        build: () => influencersPageBloc,
        act: (bloc) => bloc.add(
          const OptionTappedEvent(
            option: 'option',
            price: 0,
            description: 'description',
            influencerName: 'influencerName',
          ),
        ),
        expect: () => [
          InfluencersPageState(
            influencers: [
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
            selectedOption: 'option',
            orderDescription: 'description',
            influencerName: 'influencerName',
            orderPrice: 0,
          )
        ],
      );

      blocTest(
        'Emits correct state for SubmitOrderEvent',
        build: () => influencersPageBloc,
        act: (bloc) => bloc.add(
          SubmitOrderEvent(),
        ),
        expect: () => [],
      );
    },
  );
}
