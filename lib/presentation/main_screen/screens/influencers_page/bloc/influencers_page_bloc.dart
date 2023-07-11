import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fleeque/core/use_case.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/entities/order_details.dart';

import 'package:fleeque/domain/usecases/db_usecases/get_influencers_list_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/observe_usecase.dart';
import 'package:fleeque/domain/usecases/db_usecases/send_order_usecase.dart';

part 'influencers_page_event.dart';
part 'influencers_page_state.dart';

class InfluencersPageBloc
    extends Bloc<InfluencersPageEvent, InfluencersPageState> {
  final GetInfluencersListUseCase _getInfluencersListUseCase;
  final ObserveUseCase _observeUseCase;
  final SendOrderUseCase _sendOrderUseCase;

  StreamSubscription<List<Influencer>>? _subscription;

  InfluencersPageBloc({
    required GetInfluencersListUseCase getInfluencersListUseCase,
    required ObserveUseCase observeUseCase,
    required SendOrderUseCase sendOrderUseCase,
  })  : _getInfluencersListUseCase = getInfluencersListUseCase,
        _observeUseCase = observeUseCase,
        _sendOrderUseCase = sendOrderUseCase,
        super(
          const InfluencersPageState(
            influencers: [],
            selectedOption: '',
            orderDescription: '',
            orderPrice: 0,
            influencerName: '',
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
    on<SubmitOrderEvent>(_handleSubmitOrderEvent);
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
        orderPrice: event.price,
        orderDescription: event.description,
        influencerName: event.influencerName,
      ),
    );
  }

  Future<void> _handleSubmitOrderEvent(
    SubmitOrderEvent event,
    Emitter<InfluencersPageState> emit,
  ) async {
    await _sendOrderUseCase.execute(
      OrderDetails(
        influencerName: state.influencerName,
        orderDescription: state.orderDescription,
        orderPrice: state.orderPrice,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
