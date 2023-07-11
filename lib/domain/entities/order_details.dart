import 'package:equatable/equatable.dart';

class OrderDetails extends Equatable {
  const OrderDetails({
    required this.influencerName,
    required this.orderPrice,
    required this.orderDescription,
    required this.userId,
  });

  final String influencerName;
  final int orderPrice;
  final String orderDescription;
  final String userId;

  @override
  List<Object?> get props => [
        influencerName,
        orderPrice,
        orderDescription,
        userId,
      ];
}
