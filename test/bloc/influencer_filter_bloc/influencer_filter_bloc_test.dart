import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/presentation/main_screen/screens/influencers_filter/bloc/influencers_filter_bloc.dart';

class MockFilterInfluencersListUseCase extends Mock
    implements FilterInfluencersListUseCase {
  @override
  Future<void> execute(FilteredInfluencer params) async {
    return Future.value();
  }
}

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
          price: 0,
          time: Timestamp.fromDate(DateTime.utc(2021)),
        )
      ],
    );
  }
}

void main() {
  group(
    'InfluencersFilterBloc',
    () {
      late InfluencersFilterBloc influencersFilterBloc;

      setUp(
        () {
          influencersFilterBloc = InfluencersFilterBloc(
            filterInfluencersListUseCase: MockFilterInfluencersListUseCase(),
            getInfluencersListUseCase: MockGetInfluencersListUseCase(),
            observeUseCase: MockObserveUseCase(),
          );
        },
      );

      tearDown(
        () {
          influencersFilterBloc.close();
        },
      );

      blocTest<InfluencersFilterBloc, InfluencersFilterState>(
        'Emits correct states for PriceFilterEvent (you can pass any event if you like, just replace PriceFilterEvent with yours)',
        build: () => influencersFilterBloc,
        act: (bloc) => bloc.add(
          const PriceFilterEvent(price: 'Some price'),
        ),
        expect: () => [
          InfluencersFilterState(
            countryFilter: '',
            timeFilter: '',
            followersFilter: '',
            priceFilter: 'Some price',
            priceRange: const ['Select', '0-10', '10-50', '50-100'],
            timeRange: const ['Select', 'Newest', 'Oldest'],
            followersRange: const [
              'Select',
              '<100K followers',
              '100K to 500K followers',
              '500K to 1M followers',
              '>1M followers'
            ],
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

      blocTest<InfluencersFilterBloc, InfluencersFilterState>(
        'Emits correct states for FilterDataEvent',
        build: () => influencersFilterBloc,
        act: (bloc) {
          bloc.add(
            const PriceFilterEvent(price: 'price'),
          );
          bloc.add(
            const TimeFilterEvent(time: 'time'),
          );
          bloc.add(
            const FollowersFilterEvent(followers: 'followers'),
          );
          bloc.add(
            const CountryFilterEvent(country: 'country'),
          );
          bloc.add(FilterDataEvent());
        },
        expect: () => [
          InfluencersFilterState(
            countryFilter: 'country',
            timeFilter: 'time',
            followersFilter: 'followers',
            priceFilter: 'price',
            priceRange: const ['Select', '0-10', '10-50', '50-100'],
            timeRange: const ['Select', 'Newest', 'Oldest'],
            followersRange: const [
              'Select',
              '<100K followers',
              '100K to 500K followers',
              '500K to 1M followers',
              '>1M followers'
            ],
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
            status: FilteringStatus.filteringComplete,
          ),
        ],
        skip: 4,
      );

      blocTest<InfluencersFilterBloc, InfluencersFilterState>(
        'Emits correct states for ResetFilterEvent',
        build: () => influencersFilterBloc,
        act: (bloc) => bloc.add(ResetFilterEvent()),
        expect: () => [],
      );
    },
  );
}
