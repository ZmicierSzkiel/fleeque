part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class GetInfluencersEvent extends HomeEvent {
  const GetInfluencersEvent();

  @override
  List<Object?> get props => [];
}

final class RenderInfluencersEvent extends HomeEvent {
  final List<Influencer> influencers;
  const RenderInfluencersEvent({
    required this.influencers,
  });

  @override
  List<Object?> get props => [];
}
