part of 'influencers_bloc.dart';

class InfluencersState extends Equatable {
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

  @override
  List<Object?> get props => [influencers];
}
