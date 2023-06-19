part of 'main_screen_bloc.dart';

class MainScreenState {
  final List<Influencer> influencers;
  final int selectedIndex;

  const MainScreenState({
    required this.influencers,
    this.selectedIndex = 0,
  });

  MainScreenState copyWith({
    List<Influencer>? influencers,
    int? selectedIndex,
  }) {
    return MainScreenState(
      influencers: influencers ?? this.influencers,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
