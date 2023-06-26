import 'package:bloc/bloc.dart';
import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  final FilterInfluencersListUseCase _filterInfluencersListUseCase;
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  InfluencersBloc({
    required FilterInfluencersListUseCase filterInfluencersListUseCase,
    required GetInfluencersListUseCase getInfluencersListUseCase,
  })  : _filterInfluencersListUseCase = filterInfluencersListUseCase,
        _getInfluencersListUseCase = getInfluencersListUseCase,
        super(
          const InfluencersState(
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

  void _handlePriceFilterEvent(
    PriceFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    emit(
      state.copyWith(priceFilter: event.price),
    );
  }

  void _handleTimeFilterEvent(
    TimeFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    emit(
      state.copyWith(timeFilter: event.time),
    );
  }

  void _handleFollowersFilterEvent(
    FollowersFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    emit(
      state.copyWith(followersFilter: event.followers),
    );
  }

  void _handleCountryFilterEvent(
    CountryFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    emit(
      state.copyWith(countryFilter: event.country),
    );
  }

  Future<void> _handleFilterDataEvent(
    FilterDataEvent event,
    Emitter<InfluencersState> emit,
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
      ResetFilterEvent event, Emitter<InfluencersState> emit) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }
}
