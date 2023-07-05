part of 'initial_bloc.dart';

class InitialState extends Equatable {
  final bool? isFirstLaunch;
  final bool isLoggedIn;

  const InitialState({
    required this.isFirstLaunch,
    required this.isLoggedIn,
  });

  InitialState copyWith({
    bool? isFirstLaunch,
    bool? isLoggedIn,
  }) {
    return InitialState(
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  List<Object?> get props => [
        isFirstLaunch,
        isLoggedIn,
      ];
}
