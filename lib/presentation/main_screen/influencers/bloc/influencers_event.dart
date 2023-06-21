part of 'influencers_bloc.dart';

abstract class InfluencersEvent {
  const InfluencersEvent();
}

class CountryFilterEvent extends InfluencersEvent {
  final String country;

  CountryFilterEvent(this.country);
}

class TimeFilterEvent extends InfluencersEvent {
  final String time;

  TimeFilterEvent(this.time);
}

class PriceFilterEvent extends InfluencersEvent {
  final String price;

  PriceFilterEvent(this.price);
}

class FollowersFilterEvent extends InfluencersEvent {
  final String followers;

  FollowersFilterEvent(this.followers);
}

class FilterDataEvent extends InfluencersEvent {}
