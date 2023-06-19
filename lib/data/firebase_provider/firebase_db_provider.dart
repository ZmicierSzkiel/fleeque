import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleeque/data/models/influencer_model.dart';

class FirebaseDbProvider {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  Future<List<InfluencerMapper>> getInfluencersListFromDB() async {
    final snapshot = await _firebaseFirestore.collection('products').get();
    return snapshot.docs.map(
      (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        return InfluencerMapper.fromJson(
          doc.data(),
        );
      },
    ).toList();
  }

  Future<List<InfluencerMapper>> getFilteredInfluencersFromDB() {
    return getInfluencersListFromDB();
  }

  List<InfluencerMapper> applyFiltration(
    List<InfluencerMapper> influencers,
  ) {
    return influencers;
  }
}
