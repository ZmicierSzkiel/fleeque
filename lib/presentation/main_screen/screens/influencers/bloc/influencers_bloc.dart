import 'package:bloc/bloc.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final ObserveUseCase _observeUseCase;

  InfluencersBloc({
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required ObserveUseCase observeUseCase,
  })  : _getInfluencersListUseCase = getInfluencersListUseCase,
        _observeUseCase = observeUseCase,
        super(const InfluencersState(influencers: [])) {
    on<GetInfluencersEvent>(_handleGetInfluencersEvent);
    on<RenderInfluencersEvent>(_handleRenderInfluencersEvent);
  }

  Future<void> _handleGetInfluencersEvent(
      GetInfluencersEvent event, Emitter<InfluencersState> emit) async {
    await _getInfluencersListUseCase.execute(NoParams());
  }

  Future<void> _handleRenderInfluencersEvent(
      RenderInfluencersEvent event, Emitter<InfluencersState> emit) async {
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
