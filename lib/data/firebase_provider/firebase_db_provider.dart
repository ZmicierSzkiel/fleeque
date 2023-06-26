import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fleeque/data/models/influencer_model.dart';
import 'package:fleeque/domain/entities/filtered_influencer.dart';

class FirebaseDbProvider {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<InfluencerMapper>> getInfluencersListFromDB() async {
    final snapshot = await _db.collection('products').get();
    return snapshot.docs.map(
      (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        return InfluencerMapper.fromJson(
          doc.data(),
        );
      },
    ).toList();
  }

  Future<List<InfluencerMapper>> getFilteredInfluencersFromDB(
    FilteredInfluencer params,
  ) async {
    final QuerySnapshot<Map<String, dynamic>> filteredInfluencers =
        await _db.collection('products').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
        filteredInfluencers.docs.toList();

    if (params.price.isNotEmpty && params.price != 'Select') {
      final List<String> priceRange = params.price.split('-');
      final int minPrice = int.parse(priceRange[0]);
      final int maxPrice = int.parse(priceRange[1]);
      docs = docs.where(
        (doc) {
          final int price = doc.get('price');
          return price >= minPrice && price <= maxPrice;
        },
      ).toList();
    }

    if (params.time.isNotEmpty && params.time != 'Select') {
      docs.sort(
        ((a, b) {
          final int aTime = a.get('time').microsecondsSinceEpoch;
          final int bTime = b.get('time').microsecondsSinceEpoch;
          if (params.time == 'Newest') {
            return bTime.compareTo(aTime);
          } else if (params.time == 'Oldest') {
            return aTime.compareTo(bTime);
          }
          return -1;
        }),
      );
    }

    if (params.followers.isNotEmpty && params.followers != 'Select') {
      docs = docs.where(
        (doc) {
          final int followers = doc.get('followers');
          switch (params.followers) {
            case '<100K followers':
              return followers <= 100;
            case '100K to 500K followers':
              return followers >= 100 && followers <= 500;
            case '500K to 1M followers':
              return followers >= 500 && followers <= 1000;
            case '>1M followers':
              return followers >= 1000;
          }
          return false;
        },
      ).toList();
    }

    if (params.country.isNotEmpty && params.country != 'Select') {
      docs = docs.where(
        (doc) {
          final country = doc.get('country');
          return country == params.country;
        },
      ).toList();
    }

    return docs.map(
      (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        return InfluencerMapper.fromJson(doc.data());
      },
    ).toList();
  }
}
