import 'package:fleeque/domain/entities/order_details.dart';

class OrderDetailsMapper extends OrderDetails {
  const OrderDetailsMapper({
    required String influencerName,
    required int orderPrice,
    required String orderDescription,
  }) : super(
          influencerName: influencerName,
          orderPrice: orderPrice,
          orderDescription: orderDescription,
        );

  static OrderDetailsMapper fromJson(Map<String, dynamic> json) {
    return OrderDetailsMapper(
      influencerName: json['influencer_name'],
      orderPrice: json['order_price'],
      orderDescription: json['order_description'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'influencer_name': influencerName,
      'order_price': orderPrice,
      'order_description': orderDescription,
    };
  }
}
