part of 'influencers_filter_bloc.dart';

enum FilteringStatus {
  loading,
  filteringComplete,
  error,
}

class InfluencersFilterState extends Equatable {
  final String priceFilter;
  final String timeFilter;
  final String countryFilter;
  final String followersFilter;
  final FilteringStatus status;
  final String message;
  final List<String> priceRange;
  final List<String> timeRange;
  final List<String> followersRange;
  final List<Influencer> influencers;

  const InfluencersFilterState({
    required this.priceFilter,
    required this.timeFilter,
    required this.countryFilter,
    required this.followersFilter,
    this.status = FilteringStatus.loading,
    this.message = '',
    required this.priceRange,
    required this.timeRange,
    required this.followersRange,
    required this.influencers,
  });

  InfluencersFilterState copyWith({
    String? priceFilter,
    String? timeFilter,
    String? countryFilter,
    String? followersFilter,
    FilteringStatus? status,
    String? message,
    List<String>? priceRange,
    List<String>? timeRange,
    List<String>? followersRange,
    List<Influencer>? influencers,
  }) {
    return InfluencersFilterState(
      priceFilter: priceFilter ?? this.priceFilter,
      timeFilter: timeFilter ?? this.timeFilter,
      countryFilter: countryFilter ?? this.countryFilter,
      followersFilter: followersFilter ?? this.followersFilter,
      status: status ?? this.status,
      message: message ?? this.message,
      priceRange: priceRange ?? this.priceRange,
      timeRange: timeRange ?? this.timeRange,
      followersRange: followersRange ?? this.followersRange,
      influencers: influencers ?? this.influencers,
    );
  }

  @override
  List<Object> get props {
    return [
      priceFilter,
      timeFilter,
      countryFilter,
      followersFilter,
      status,
      message,
      priceRange,
      timeRange,
      followersRange,
      influencers,
    ];
  }
}
