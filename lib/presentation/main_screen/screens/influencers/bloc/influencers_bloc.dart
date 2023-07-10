import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final ObserveUseCase _observeUseCase;

  StreamSubscription<List<Influencer>>? _subscription;

  InfluencersBloc({
    required ObserveUseCase observeUseCase,
    required GetInfluencersListUseCase getInfluencersListUseCase,
  })  : _getInfluencersListUseCase = getInfluencersListUseCase,
        _observeUseCase = observeUseCase,
        super(
          const InfluencersState(influencers: []),
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
    Emitter<InfluencersState> emit,
  ) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Future<void> _handleRenderInfluencersEvent(
    RenderInfluencersEvent event,
    Emitter<InfluencersState> emit,
  ) async {
    emit(
      state.copyWith(
        influencers: event.influencers,
      ),
    );
  }
}
