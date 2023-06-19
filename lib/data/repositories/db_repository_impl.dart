import 'dart:async';

import 'package:fleeque/data/firebase_provider/firebase_db_provider.dart';
import 'package:fleeque/data/models/influencer_model.dart';

import 'package:fleeque/domain/repositories/db_repository.dart';

class DbRepositoryImpl implements DbRepository {
  final FirebaseDbProvider _firebaseDbProvider;

  DbRepositoryImpl({
    required FirebaseDbProvider firebaseDbProvider,
  }) : _firebaseDbProvider = firebaseDbProvider;

  @override
  Future<List<InfluencerMapper>> getInfluencersList() {
    return _firebaseDbProvider.getInfluencersListFromDB();
  }

  @override
  Future<List<InfluencerMapper>> getFilteredInfluencers() {
    return _firebaseDbProvider.getFilteredInfluencersFromDB();
  }
}
