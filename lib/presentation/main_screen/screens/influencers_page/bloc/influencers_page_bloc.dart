import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

part 'influencers_page_event.dart';
part 'influencers_page_state.dart';

class InfluencersPageBloc
    extends Bloc<InfluencersPageEvent, InfluencersPageState> {
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final ObserveUseCase _observeUseCase;

  StreamSubscription<List<Influencer>>? _subscription;

  InfluencersPageBloc({
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required ObserveUseCase observeUseCase,
  })  : _getInfluencersListUseCase = getInfluencersListUseCase,
        _observeUseCase = observeUseCase,
        super(
          const InfluencersPageState(
            influencers: [],
            selectedOption: '',
          ),
        ) {
    _subscription ??= _observeUseCase.execute(NoParams()).listen(
      (list) {
        add(
          RenderInfluencersEvent(influencers: list),
        );
      },
    );
    on<GetInfluencersEvent>(_handleGetInfluencersEvent);
    on<RenderInfluencersEvent>(_handleRenderInfluencersEvent);
    on<OptionTappedEvent>(_handleOptionTappedEvent);
  }

  Future<void> _handleGetInfluencersEvent(
    GetInfluencersEvent event,
    Emitter<InfluencersPageState> emit,
  ) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }

  Future<void> _handleRenderInfluencersEvent(
    RenderInfluencersEvent event,
    Emitter<InfluencersPageState> emit,
  ) async {
    emit(
      state.copyWith(
        influencers: event.influencers,
      ),
    );
  }

  void _handleOptionTappedEvent(
    OptionTappedEvent event,
    Emitter<InfluencersPageState> emit,
  ) {
    emit(
      state.copyWith(
        selectedOption: event.option,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
