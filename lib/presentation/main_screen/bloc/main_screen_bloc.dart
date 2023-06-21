import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final ObserveUseCase _observeUseCase;
  final GetInfluencersListUseCase _getInfluencersListUseCase;

  MainScreenBloc({
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required ObserveUseCase observeUseCase,
  })  : _observeUseCase = observeUseCase,
        _getInfluencersListUseCase = getInfluencersListUseCase,
        super(
          const MainScreenState(influencers: []),
        ) {
    on<GetInfluencersEvent>(_handleGetInfluencersEvent);
    on<GetFilteredInfluencersEvent>(_handleGetFilteredInfluencersEvent);
    on<ItemTappedEvent>(_handleItemTappedEvent);
  }

  Future<void> _handleGetInfluencersEvent(
      GetInfluencersEvent event, Emitter<MainScreenState> emit) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }

  Future<void> _handleGetFilteredInfluencersEvent(
    GetFilteredInfluencersEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    final Stream<List<Influencer>> streamInfluencers =
        _observeUseCase.execute(NoParams());
    await for (final List<Influencer> influencers in streamInfluencers) {
      emit(
        state.copyWith(
          influencers: influencers,
        ),
      );
    }
  }

  void _handleItemTappedEvent(
    ItemTappedEvent event,
    Emitter<MainScreenState> emit,
  ) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
