part of 'influencers_filter_bloc.dart';

abstract class InfluencersFilterEvent {
  const InfluencersFilterEvent();
}

class CountryFilterEvent extends InfluencersFilterEvent {
  final String country;

  CountryFilterEvent(this.country);
}

class TimeFilterEvent extends InfluencersFilterEvent {
  final String time;

  TimeFilterEvent(this.time);
}

class PriceFilterEvent extends InfluencersFilterEvent {
  final String price;

  PriceFilterEvent(this.price);
}

class FollowersFilterEvent extends InfluencersFilterEvent {
  final String followers;

  FollowersFilterEvent(this.followers);
}

class FilterDataEvent extends InfluencersFilterEvent {}

class ResetFilterEvent extends InfluencersFilterEvent {}
