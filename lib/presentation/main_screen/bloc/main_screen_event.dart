part of 'main_screen_bloc.dart';

sealed class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

final class ItemTappedEvent extends MainScreenEvent {
  final int index;

  const ItemTappedEvent({required this.index});

  @override
  List<Object> get props => [index];
}
