import 'package:bloc/bloc.dart';

import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_filter_influencers_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final GetFilterInfluencersUseCase _getFilterInfluencersUseCase;

  MainScreenBloc({
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required GetFilterInfluencersUseCase getFilterInfluencersUseCase,
  })  : _getInfluencersListUseCase = getInfluencersListUseCase,
        _getFilterInfluencersUseCase = getFilterInfluencersUseCase,
        super(
          const MainScreenState(influencers: []),
        ) {
    on<GetInfluencersEvent>(_handleGetInfluencersEvent);
    on<ItemTappedEvent>(_handleItemTappedEvent);
    on<GetFilteredInfluencersEvent>(_handleGetFilteredInfluencersEvent);
  }

  Future<void> _handleGetInfluencersEvent(
    GetInfluencersEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    final influencers = await _getInfluencersListUseCase.execute(NoParams());
    emit(
      state.copyWith(
        influencers: influencers,
      ),
    );
  }

  void _handleItemTappedEvent(
    ItemTappedEvent event,
    Emitter<MainScreenState> emit,
  ) {
    emit(state.copyWith(selectedIndex: event.index));
  }

  void _handleGetFilteredInfluencersEvent(
    GetFilteredInfluencersEvent event,
    Emitter<MainScreenState> emit,
  ) {}
}
