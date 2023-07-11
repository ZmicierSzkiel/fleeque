import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleeque/domain/entities/order_details.dart';

class OrderDetailsMapper extends OrderDetails {
  const OrderDetailsMapper({
    required String influencerName,
    required int orderPrice,
    required String orderDescription,
    required String userId,
    required Timestamp timestamp,
  }) : super(
          influencerName: influencerName,
          orderPrice: orderPrice,
          orderDescription: orderDescription,
          userId: userId,
          timestamp: timestamp,
        );

  static OrderDetailsMapper fromJson(Map<String, dynamic> json) {
    return OrderDetailsMapper(
      influencerName: json['influencer_name'],
      orderPrice: json['order_price'],
      orderDescription: json['order_description'],
      userId: json['user_id'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'influencer_name': influencerName,
      'order_price': orderPrice,
      'order_description': orderDescription,
      'user_id': userId,
      'timestamp': timestamp,
    };
  }
}
