import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fleeque/core/use_case.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/usecases/db_usecases/get_order_usecase.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetOrderUseCase _getOrderUseCase;

  PaymentBloc({
    required GetOrderUseCase getOrderUseCase,
  })  : _getOrderUseCase = getOrderUseCase,
        super(
          const PaymentState(
            orderDetails: [],
          ),
        ) {
    on<GetOrderDetailsEvent>(_handleGetOrderDetailsEvent);
  }

  Future<void> _handleGetOrderDetailsEvent(
    GetOrderDetailsEvent event,
    Emitter<PaymentState> emit,
  ) async {
    final List<OrderDetails> orderDetailsRequest =
        await _getOrderUseCase.execute(
      NoParams(),
    );
    emit(
      state.copyWith(orderDetails: orderDetailsRequest),
    );
  }
}
