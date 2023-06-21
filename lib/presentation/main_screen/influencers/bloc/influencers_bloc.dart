import 'package:bloc/bloc.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  InfluencersBloc() : super(const InfluencersState()) {
    on<PriceFilterEvent>(_handlePriceFilterEvent);
    on<DateFilterEvent>(_handleDateFilterEvent);
    on<PopularityFilterEvent>(_handlePopularityFilterEvent);
    on<CountryFilterEvent>(_handleCountryFilterEvent);
  }

  void _handlePriceFilterEvent(
    PriceFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    final filteredPrice = emit(
      state.copyWith(priceFilter: event.price),
    );
  }

  void _handleDateFilterEvent(
    DateFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    final filteredData = emit(
      state.copyWith(dateFilter: event.date),
    );
  }

  void _handlePopularityFilterEvent(
    PopularityFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    final filteredPopularity = emit(
      state.copyWith(popularityFilter: event.popularity),
    );
  }

  void _handleCountryFilterEvent(
    CountryFilterEvent event,
    Emitter<InfluencersState> emit,
  ) {
    final filteredCountry = emit(
      state.copyWith(countryFilter: event.country),
    );
  }
}
