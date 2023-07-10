part of 'initial_bloc.dart';

sealed class InitialEvent extends Equatable {
  const InitialEvent();
}

final class IsFirstLaunch extends InitialEvent {
  @override
  List<Object?> get props => [];
}

final class SetFirstLaunch extends InitialEvent {
  @override
  List<Object?> get props => [];
}
