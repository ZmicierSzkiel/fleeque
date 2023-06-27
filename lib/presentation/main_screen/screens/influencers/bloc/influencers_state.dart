part of 'influencers_bloc.dart';

class InfluencersState {
  final List<Influencer> influencers;
  const InfluencersState({
    required this.influencers,
  });

  InfluencersState copyWith({
    List<Influencer>? influencers,
  }) {
    return InfluencersState(
      influencers: influencers ?? this.influencers,
    );
  }
}
