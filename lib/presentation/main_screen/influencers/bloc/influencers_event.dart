part of 'influencers_bloc.dart';

abstract class InfluencersEvent {
  const InfluencersEvent();
}

class CountryFilterEvent extends InfluencersEvent {
  final String country;

  CountryFilterEvent(this.country);
}

class DateFilterEvent extends InfluencersEvent {
  final String date;

  DateFilterEvent(this.date);
}

class PriceFilterEvent extends InfluencersEvent {
  final String price;

  PriceFilterEvent(this.price);
}

class PopularityFilterEvent extends InfluencersEvent {
  final String popularity;

  PopularityFilterEvent(this.popularity);
}
