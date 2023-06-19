part of 'initial_bloc.dart';

sealed class InitialEvent {
  const InitialEvent();
}

final class IsFirstLaunch extends InitialEvent {}

final class SetFirstLaunch extends InitialEvent {}
