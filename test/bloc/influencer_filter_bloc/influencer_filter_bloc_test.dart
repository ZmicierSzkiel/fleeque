import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
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

void main() {
  group(
    'InfluencersFilterBloc',
    () {
      late InfluencersFilterBloc influencersFilterBloc;
      late MockFilterInfluencersListUseCase mockFilterInfluencersListUseCase;
      late MockGetInfluencersListUseCase mockGetInfluencersListUseCase;

      setUp(
        () {
          mockFilterInfluencersListUseCase = MockFilterInfluencersListUseCase();
          mockGetInfluencersListUseCase = MockGetInfluencersListUseCase();
          influencersFilterBloc = InfluencersFilterBloc(
            filterInfluencersListUseCase: mockFilterInfluencersListUseCase,
            getInfluencersListUseCase: mockGetInfluencersListUseCase,
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
          const InfluencersFilterState(
            countryFilter: '',
            timeFilter: '',
            followersFilter: '',
            priceFilter: 'Some price',
            priceRange: ['Select', '0-10', '10-50', '50-100'],
            timeRange: ['Select', 'Newest', 'Oldest'],
            followersRange: [
              'Select',
              '<100K followers',
              '100K to 500K followers',
              '500K to 1M followers',
              '>1M followers'
            ],
          ),
        ],
      );

      blocTest<InfluencersFilterBloc, InfluencersFilterState>(
        'Emits correct states for FilterDataEvent',
        build: () => InfluencersFilterBloc(
          filterInfluencersListUseCase: MockFilterInfluencersListUseCase(),
          getInfluencersListUseCase: MockGetInfluencersListUseCase(),
        ),
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
          const InfluencersFilterState(
            countryFilter: 'country',
            timeFilter: 'time',
            followersFilter: 'followers',
            priceFilter: 'price',
            priceRange: ['Select', '0-10', '10-50', '50-100'],
            timeRange: ['Select', 'Newest', 'Oldest'],
            followersRange: [
              'Select',
              '<100K followers',
              '100K to 500K followers',
              '500K to 1M followers',
              '>1M followers'
            ],
            status: FilteringStatus.filteringComplete,
          ),
        ],
        skip: 4,
      );

      blocTest<InfluencersFilterBloc, InfluencersFilterState>(
        'Emits correct states for ResetFilterEvent',
        build: () => InfluencersFilterBloc(
          filterInfluencersListUseCase: MockFilterInfluencersListUseCase(),
          getInfluencersListUseCase: MockGetInfluencersListUseCase(),
        ),
        act: (bloc) => bloc.add(ResetFilterEvent()),
        expect: () => [],
      );
    },
  );
}
