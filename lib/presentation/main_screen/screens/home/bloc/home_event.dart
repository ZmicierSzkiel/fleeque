part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class GetInfluencersEvent extends HomeEvent {
  const GetInfluencersEvent();
}

final class RenderInfluencersEvent extends HomeEvent {
  const RenderInfluencersEvent();
}
