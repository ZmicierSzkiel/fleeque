part of 'influencers_page_bloc.dart';

class InfluencersPageState extends Equatable {
  final List<Influencer> influencers;
  final String selectedOption;

  const InfluencersPageState({
    required this.influencers,
    required this.selectedOption,
  });

  InfluencersPageState copyWith({
    List<Influencer>? influencers,
    String? selectedOption,
  }) {
    return InfluencersPageState(
      influencers: influencers ?? this.influencers,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }

  @override
  List<Object> get props => [
        influencers,
        selectedOption,
      ];
}
