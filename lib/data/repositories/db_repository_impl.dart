import 'dart:async';

import 'package:fleeque/data/firebase_provider/firebase_db_provider.dart';
import 'package:fleeque/data/models/influencer_model.dart';

import 'package:fleeque/domain/repositories/db_repository.dart';

class DbRepositoryImpl implements DbRepository {
  final FirebaseDbProvider _firebaseDbProvider;
  final StreamController<List<InfluencerMapper>> _streamController =
      StreamController<List<InfluencerMapper>>.broadcast();

  DbRepositoryImpl({
    required FirebaseDbProvider firebaseDbProvider,
  }) : _firebaseDbProvider = firebaseDbProvider;

  @override
  Future<void> getInfluencersList() async {
    List<InfluencerMapper> influencersList =
        await _firebaseDbProvider.getInfluencersListFromDB();
    _streamController.add(influencersList);
  }

  @override
  Stream<List<InfluencerMapper>> observe() {
    return _streamController.stream;
  }

  void dispose() {
    _streamController.close();
  }
}
