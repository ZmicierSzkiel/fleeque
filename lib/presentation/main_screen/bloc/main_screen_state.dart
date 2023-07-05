part of 'main_screen_bloc.dart';

final class MainScreenState extends Equatable {
  final int selectedIndex;

  const MainScreenState({
    this.selectedIndex = 0,
  });

  MainScreenState copyWith({
    int? selectedIndex,
  }) {
    return MainScreenState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndex,
      ];
}
