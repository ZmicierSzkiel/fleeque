part of 'home_bloc.dart';

class HomeState {
  final List<Influencer> influencers;

  const HomeState({
    required this.influencers,
  });

  HomeState copyWith({
    List<Influencer>? influencers,
  }) {
    return HomeState(
      influencers: influencers ?? this.influencers,
    );
  }
}
