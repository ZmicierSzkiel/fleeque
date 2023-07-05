part of 'influencers_filter_bloc.dart';

sealed class InfluencersFilterEvent extends Equatable {
  const InfluencersFilterEvent();
}

final class CountryFilterEvent extends InfluencersFilterEvent {
  final String country;

  const CountryFilterEvent({required this.country});

  @override
  List<Object?> get props => [country];
}

final class TimeFilterEvent extends InfluencersFilterEvent {
  final String time;

  const TimeFilterEvent({required this.time});

  @override
  List<Object?> get props => [time];
}

final class PriceFilterEvent extends InfluencersFilterEvent {
  final String price;

  const PriceFilterEvent({required this.price});

  @override
  List<Object?> get props => [price];
}

final class FollowersFilterEvent extends InfluencersFilterEvent {
  final String followers;

  const FollowersFilterEvent({required this.followers});

  @override
  List<Object?> get props => [followers];
}

final class FilterDataEvent extends InfluencersFilterEvent {
  @override
  List<Object?> get props => [];
}

final class ResetFilterEvent extends InfluencersFilterEvent {
  @override
  List<Object?> get props => [];
}
