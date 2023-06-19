part of 'influencers_bloc.dart';

enum FilterOption {
  value,
  country,
}

class InfluencersState {
  final String? filterSelectedValue;
  final String? filterByCountry;

  const InfluencersState({
    this.filterSelectedValue,
    this.filterByCountry,
  });

  InfluencersState copyWith({
    String? filterSelectedValue,
    String? filterByCountry,
  }) {
    return InfluencersState(
      filterSelectedValue: filterSelectedValue ?? this.filterSelectedValue,
      filterByCountry: filterByCountry ?? this.filterByCountry,
    );
  }
}
