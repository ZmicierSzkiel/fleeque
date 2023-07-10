part of 'influencers_bloc.dart';

sealed class InfluencersEvent extends Equatable {
  const InfluencersEvent();
}

final class GetInfluencersEvent extends InfluencersEvent {
  const GetInfluencersEvent();

  @override
  List<Object?> get props => [];
}

final class RenderInfluencersEvent extends InfluencersEvent {
  final List<Influencer> influencers;

  const RenderInfluencersEvent({
    required this.influencers,
  });

  @override
  List<Object?> get props => [influencers];
}
