import 'package:bloc/bloc.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  InfluencersBloc() : super(const InfluencersState()) {
    on<FilterValueChangedEvent>(_handleFilterValueChangedEvent);
    on<FilterByCountryEvent>(_handleFilterByCountryEvent);
  }

  void _handleFilterValueChangedEvent(
    FilterValueChangedEvent event,
    Emitter<InfluencersState> emit,
  ) {
    emit(state.copyWith(filterSelectedValue: event.value));
  }

  void _handleFilterByCountryEvent(
    FilterByCountryEvent event,
    Emitter<InfluencersState> emit,
  ) {
    emit(state.copyWith(filterByCountry: event.country));
  }
}
