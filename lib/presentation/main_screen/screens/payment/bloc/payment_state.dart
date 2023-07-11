part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final List<OrderDetails> orderDetails;

  const PaymentState({
    required this.orderDetails,
  });

  PaymentState copyWith({
    List<OrderDetails>? orderDetails,
    int? orderDetailsIndex,
  }) {
    return PaymentState(
      orderDetails: orderDetails ?? this.orderDetails,
    );
  }

  @override
  List<Object> get props => [
        orderDetails,
      ];
}
