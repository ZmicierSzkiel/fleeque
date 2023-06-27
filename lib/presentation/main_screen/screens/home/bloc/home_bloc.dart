import 'package:bloc/bloc.dart';

import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final ObserveUseCase _observeUseCase;
  HomeBloc({
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required ObserveUseCase observeUseCase,
  })  : _getInfluencersListUseCase = getInfluencersListUseCase,
        _observeUseCase = observeUseCase,
        super(const HomeState(influencers: [])) {
    on<GetInfluencersEvent>(_handleGetInfluencersEvent);
    on<RenderInfluencersEvent>(_handleRenderInfluencersEvent);
  }

  Future<void> _handleGetInfluencersEvent(
      GetInfluencersEvent event, Emitter<HomeState> emit) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }

  Future<void> _handleRenderInfluencersEvent(
      RenderInfluencersEvent event, Emitter<HomeState> emit) async {
    final Stream<List<Influencer>> streamedInfluencers =
        _observeUseCase.execute(NoParams());
    await for (final List<Influencer> influencers in streamedInfluencers) {
      emit(
        state.copyWith(
          influencers: influencers,
        ),
      );
    }
  }
}
