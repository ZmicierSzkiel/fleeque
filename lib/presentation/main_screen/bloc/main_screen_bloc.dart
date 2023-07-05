import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc()
      : super(const MainScreenState(
          selectedIndex: 0,
        )) {
    on<ItemTappedEvent>(_handleItemTappedEvent);
  }

  void _handleItemTappedEvent(
    ItemTappedEvent event,
    Emitter<MainScreenState> emit,
  ) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
