part of 'main_screen_bloc.dart';

sealed class MainScreenEvent {
  const MainScreenEvent();
}

final class GetInfluencersEvent extends MainScreenEvent {
  const GetInfluencersEvent();
}

final class ItemTappedEvent extends MainScreenEvent {
  final int index;

  ItemTappedEvent(this.index);
}

final class GetFilteredInfluencersEvent extends MainScreenEvent {}
