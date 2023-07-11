import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/domain/entities/order_details.dart';

abstract class DbRepository {
  Future<void> getInfluencersList();
  Stream<List<Influencer>> observe();
  Future<void> filterInfluencersList(FilteredInfluencer params);
  Future<void> sendOrder(OrderDetails params);
  Future<List<OrderDetails>> getOrder();
}
