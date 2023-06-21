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
    final filteredInfluencers = _db.collection('products');
    Query<Map<String, dynamic>> filteredQuery = filteredInfluencers;

    if (params.time != 'Select') {
      if (params.time == 'Newest') {
        filteredQuery = filteredQuery.orderBy(
          'time',
          descending: true,
        );
      } else if (params.time == 'Oldest') {
        filteredQuery = filteredQuery.orderBy(
          'time',
          descending: false,
        );
      }
    }

    if (params.price != 'Select') {
      final List<String> priceRange = params.price.split('-');
      final int minPrice = int.parse(priceRange[0]);
      final int maxPrice = int.parse(priceRange[1]);
      filteredQuery = filteredQuery.where(
        'price',
        isGreaterThanOrEqualTo: minPrice,
        isLessThanOrEqualTo: maxPrice,
      );
    }

    if (params.followers != 'Select') {
      if (params.followers == '<100K followers') {
        filteredQuery = filteredQuery.where(
          'followers',
          isLessThanOrEqualTo: 100,
        );
      } else if (params.followers == '100K to 500K followers') {
        filteredQuery = filteredQuery.where(
          'followers',
          isGreaterThanOrEqualTo: 100,
          isLessThanOrEqualTo: 500,
        );
      } else if (params.followers == '500K to 1M followers') {
        filteredQuery = filteredQuery.where(
          'followers',
          isGreaterThanOrEqualTo: 500,
          isLessThanOrEqualTo: 1000,
        );
      } else if (params.followers == '>1M followers') {
        filteredQuery = filteredQuery.where(
          'followers',
          isGreaterThanOrEqualTo: 1000,
        );
      }
    }
    if (params.country != 'Select') {
      filteredQuery = filteredQuery.where('country', isEqualTo: params.country);
    }

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await filteredQuery.get();
    return querySnapshot.docs.map(
      (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        return InfluencerMapper.fromJson(doc.data());
      },
    ).toList();
  }
}
