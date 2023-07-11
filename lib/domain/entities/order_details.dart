import 'package:equatable/equatable.dart';

class OrderDetails extends Equatable {
  const OrderDetails({
    required this.influencerName,
    required this.orderPrice,
    required this.orderDescription,
  });

  final String influencerName;
  final int orderPrice;
  final String orderDescription;

  @override
  List<Object?> get props => [
        influencerName,
        orderPrice,
        orderDescription,
      ];
}
