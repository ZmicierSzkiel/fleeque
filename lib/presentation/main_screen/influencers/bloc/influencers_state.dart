// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'influencers_bloc.dart';

class InfluencersState {
  final String? priceFilter;
  final String? dateFilter;
  final String? countryFilter;
  final String? popularityFilter;

  const InfluencersState({
    this.priceFilter,
    this.dateFilter,
    this.countryFilter,
    this.popularityFilter,
  });

  InfluencersState copyWith({
    String? priceFilter,
    String? dateFilter,
    String? countryFilter,
    String? popularityFilter,
  }) {
    return InfluencersState(
      priceFilter: priceFilter ?? this.priceFilter,
      dateFilter: dateFilter ?? this.dateFilter,
      countryFilter: countryFilter ?? this.countryFilter,
      popularityFilter: popularityFilter ?? this.popularityFilter,
    );
  }
}
