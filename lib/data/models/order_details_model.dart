import 'package:fleeque/domain/entities/order_details.dart';

class OrderDetailsMapper extends OrderDetails {
  const OrderDetailsMapper({
    required String influencerName,
    required int orderPrice,
    required String orderDescription,
    required String userId,
  }) : super(
          influencerName: influencerName,
          orderPrice: orderPrice,
          orderDescription: orderDescription,
          userId: userId,
        );

  static OrderDetailsMapper fromJson(Map<String, dynamic> json) {
    return OrderDetailsMapper(
      influencerName: json['influencer_name'],
      orderPrice: json['order_price'],
      orderDescription: json['order_description'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'influencer_name': influencerName,
      'order_price': orderPrice,
      'order_description': orderDescription,
      'user_id': userId,
    };
  }
}
