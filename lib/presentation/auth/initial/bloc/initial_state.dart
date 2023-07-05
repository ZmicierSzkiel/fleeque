// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'initial_bloc.dart';

class InitialState {
  final bool? isFirstLaunch;
  final bool isLoggedIn;

  InitialState({
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
}
