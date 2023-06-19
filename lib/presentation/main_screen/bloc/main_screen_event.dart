part of 'main_screen_bloc.dart';

abstract class MainScreenEvent {
  const MainScreenEvent();
}

class GetInfluencersEvent extends MainScreenEvent {
  const GetInfluencersEvent();
}

class ItemTappedEvent extends MainScreenEvent {
  final int index;

  ItemTappedEvent(this.index);
}

class GetFilteredInfluencersEvent extends MainScreenEvent {}
