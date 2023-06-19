part of 'influencers_bloc.dart';

abstract class InfluencersEvent {
  const InfluencersEvent();
}

class FilterValueChangedEvent extends InfluencersEvent {
  final String? value;

  FilterValueChangedEvent(this.value);
}

class FilterByCountryEvent extends InfluencersEvent {
  final String? country;

  FilterByCountryEvent(this.country);
}
