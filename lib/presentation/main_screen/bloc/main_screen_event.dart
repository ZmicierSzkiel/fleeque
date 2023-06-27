part of 'main_screen_bloc.dart';

sealed class MainScreenEvent {
  const MainScreenEvent();
}

final class ItemTappedEvent extends MainScreenEvent {
  final int index;

  ItemTappedEvent(this.index);
}
