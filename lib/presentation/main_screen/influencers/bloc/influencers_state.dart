part of 'influencers_bloc.dart';

enum FilteringStatus {
  loading,
  filteringComplete,
  error,
}

class InfluencersState {
  final String priceFilter;
  final String timeFilter;
  final String countryFilter;
  final String followersFilter;
  final FilteringStatus status;
  final String message;

  const InfluencersState({
    required this.priceFilter,
    required this.timeFilter,
    required this.countryFilter,
    required this.followersFilter,
    this.status = FilteringStatus.loading,
    this.message = '',
  });

  InfluencersState copyWith({
    String? priceFilter,
    String? timeFilter,
    String? countryFilter,
    String? followersFilter,
    FilteringStatus? status,
    String? message,
  }) {
    return InfluencersState(
      priceFilter: priceFilter ?? this.priceFilter,
      timeFilter: timeFilter ?? this.timeFilter,
      countryFilter: countryFilter ?? this.countryFilter,
      followersFilter: followersFilter ?? this.followersFilter,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
