import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/filter_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

part 'influencers_filter_event.dart';
part 'influencers_filter_state.dart';

class InfluencersFilterBloc
    extends Bloc<InfluencersFilterEvent, InfluencersFilterState> {
  final FilterInfluencersListUseCase _filterInfluencersListUseCase;
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final ObserveUseCase _observeUseCase;

  StreamSubscription<List<Influencer>>? _subscription;

  InfluencersFilterBloc({
    required FilterInfluencersListUseCase filterInfluencersListUseCase,
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required ObserveUseCase observeUseCase,
  })  : _filterInfluencersListUseCase = filterInfluencersListUseCase,
        _getInfluencersListUseCase = getInfluencersListUseCase,
        _observeUseCase = observeUseCase,
        super(
          const InfluencersFilterState(
            countryFilter: '',
            timeFilter: '',
            followersFilter: '',
            priceFilter: '',
            priceRange: [
              'Select',
              '0-10',
              '10-50',
              '50-100',
            ],
            timeRange: [
              'Select',
              'Newest',
              'Oldest',
            ],
            followersRange: [
              'Select',
              '<100K followers',
              '100K to 500K followers',
              '500K to 1M followers',
              '>1M followers'
            ],
            influencers: [],
          ),
        ) {
    _subscription ??= _observeUseCase.execute(NoParams()).listen(
      (list) {
        add(
          RenderInfluencersEvent(influencers: list),
        );
      },
    );
    on<PriceFilterEvent>(_handlePriceFilterEvent);
    on<TimeFilterEvent>(_handleTimeFilterEvent);
    on<FollowersFilterEvent>(_handleFollowersFilterEvent);
    on<CountryFilterEvent>(_handleCountryFilterEvent);
    on<FilterDataEvent>(_handleFilterDataEvent);
    on<ResetFilterEvent>(_handleResetFilterEvent);
    on<RenderInfluencersEvent>(_handleRenderInfluencersEvent);
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
    ResetFilterEvent event,
    Emitter<InfluencersFilterState> emit,
  ) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }

  Future<void> _handleRenderInfluencersEvent(RenderInfluencersEvent event,
      Emitter<InfluencersFilterState> emit) async {
    emit(
      state.copyWith(
        influencers: event.influencers,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
