import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class OrderDetails extends Equatable {
  const OrderDetails({
    required this.influencerName,
    required this.orderPrice,
    required this.orderDescription,
    required this.userId,
    required this.timestamp,
  });

  final String influencerName;
  final int orderPrice;
  final String orderDescription;
  final String userId;
  final Timestamp timestamp;

  @override
  List<Object?> get props => [
        influencerName,
        orderPrice,
        orderDescription,
        userId,
        timestamp,
      ];
}
