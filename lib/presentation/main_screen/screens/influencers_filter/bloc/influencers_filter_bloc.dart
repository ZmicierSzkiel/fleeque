import 'package:bloc/bloc.dart';
import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';

part 'influencers_filter_event.dart';
part 'influencers_filter_state.dart';

class InfluencersFilterBloc
    extends Bloc<InfluencersFilterEvent, InfluencersFilterState> {
  final FilterInfluencersListUseCase _filterInfluencersListUseCase;
  final GetInfluencersListUseCase _getInfluencersListUseCase;

  final List<String> priceRange = [
    'Select',
    '0-10',
    '10-50',
    '50-100',
  ];
  final List<String> timeRange = [
    'Select',
    'Newest',
    'Oldest',
  ];
  final List<String> followersRange = [
    'Select',
    '<100K followers',
    '100K to 500K followers',
    '500K to 1M followers',
    '>1M followers'
  ];

  InfluencersFilterBloc({
    required FilterInfluencersListUseCase filterInfluencersListUseCase,
    required GetInfluencersListUseCase getInfluencersListUseCase,
  })  : _filterInfluencersListUseCase = filterInfluencersListUseCase,
        _getInfluencersListUseCase = getInfluencersListUseCase,
        super(
          const InfluencersFilterState(
            countryFilter: '',
            timeFilter: '',
            followersFilter: '',
            priceFilter: '',
          ),
        ) {
    on<PriceFilterEvent>(_handlePriceFilterEvent);
    on<TimeFilterEvent>(_handleTimeFilterEvent);
    on<FollowersFilterEvent>(_handleFollowersFilterEvent);
    on<CountryFilterEvent>(_handleCountryFilterEvent);
    on<FilterDataEvent>(_handleFilterDataEvent);
    on<ResetFilterEvent>(_handleResetFilterEvent);
  }

  List<String> getPriceRange() {
    return priceRange;
  }

  List<String> getTimeRange() {
    return timeRange;
  }

  List<String> getFollowersRange() {
    return followersRange;
  }

  void _handlePriceFilterEvent(
    PriceFilterEvent event,
    Emitter<InfluencersFilterState> emit,
  ) {
    emit(
      state.copyWith(priceFilter: event.price),
    );
  }

  void _handleTimeFilterEvent(
    TimeFilterEvent event,
    Emitter<InfluencersFilterState> emit,
  ) {
    emit(
      state.copyWith(timeFilter: event.time),
    );
  }

  void _handleFollowersFilterEvent(
    FollowersFilterEvent event,
    Emitter<InfluencersFilterState> emit,
  ) {
    emit(
      state.copyWith(followersFilter: event.followers),
    );
  }

  void _handleCountryFilterEvent(
    CountryFilterEvent event,
    Emitter<InfluencersFilterState> emit,
  ) {
    emit(
      state.copyWith(countryFilter: event.country),
    );
  }

  Future<void> _handleFilterDataEvent(
    FilterDataEvent event,
    Emitter<InfluencersFilterState> emit,
  ) async {
    final filteredPrice = state.priceFilter;
    final filteredTime = state.timeFilter;
    final filteredFollowers = state.followersFilter;
    final filteredCountry = state.countryFilter;

    try {
      await _filterInfluencersListUseCase.execute(
        FilteredInfluencer(
          price: filteredPrice,
          time: filteredTime,
          followers: filteredFollowers,
          country: filteredCountry,
        ),
      );
      emit(
        state.copyWith(
          status: FilteringStatus.filteringComplete,
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: FilteringStatus.error,
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _handleResetFilterEvent(
      ResetFilterEvent event, Emitter<InfluencersFilterState> emit) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }
}
