import 'dart:async';

import 'package:fleeque/data/firebase_provider/firebase_db_provider.dart';
import 'package:fleeque/data/models/influencer_model.dart';

import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/entities/order_details.dart';
import 'package:fleeque/domain/repositories/db_repository.dart';

class DbRepositoryImpl implements DbRepository {
  final FirebaseDbProvider _dbProvider;
  final StreamController<List<InfluencerMapper>> _streamController =
      StreamController<List<InfluencerMapper>>.broadcast();

  DbRepositoryImpl({
    required FirebaseDbProvider dbProvider,
  }) : _dbProvider = dbProvider;

  @override
  Future<void> getInfluencersList() async {
    final List<InfluencerMapper> influencersList =
        await _dbProvider.getInfluencersListFromDB();
    _streamController.add(influencersList);
  }

  @override
  Stream<List<InfluencerMapper>> observe() {
    return _streamController.stream;
  }

  @override
  Future<void> filterInfluencersList(
    FilteredInfluencer params,
  ) async {
    final List<InfluencerMapper> filteredList =
        await _dbProvider.getFilteredInfluencersFromDB(params);
    _streamController.add(filteredList);
  }

  @override
  Future<void> sendOrder(
    OrderDetails params,
  ) async {
    await _dbProvider.sendOrderToDB(params);
  }

  @override
  Future<List<OrderDetails>> getOrder() async {
    final List<OrderDetails> orderDetails = await _dbProvider.getOrderFromDB();
    return orderDetails;
  }

  void dispose() {
    _streamController.close();
  }
}
