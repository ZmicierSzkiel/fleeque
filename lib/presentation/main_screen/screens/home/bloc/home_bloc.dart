import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final ObserveUseCase _observeUseCase;

  StreamSubscription<List<Influencer>>? _subscription;

  HomeBloc({
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required ObserveUseCase observeUseCase,
  })  : _getInfluencersListUseCase = getInfluencersListUseCase,
        _observeUseCase = observeUseCase,
        super(
          const HomeState(
            influencers: [],
          ),
        ) {
    _subscription ??= _observeUseCase.execute(NoParams()).listen(
      (list) {
        add(RenderInfluencersEvent(influencers: list));
      },
    );
    on<GetInfluencersEvent>(_handleGetInfluencersEvent);
    on<RenderInfluencersEvent>(_handleRenderInfluencersEvent);
  }

  Future<void> _handleGetInfluencersEvent(
    GetInfluencersEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }

  Future<void> _handleRenderInfluencersEvent(
    RenderInfluencersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        influencers: event.influencers,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  void dispose() {
    _subscription?.cancel();
  }
}
