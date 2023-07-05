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
  const RenderInfluencersEvent();

  @override
  List<Object?> get props => [];
}
