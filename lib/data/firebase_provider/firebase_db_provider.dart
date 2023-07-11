import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fleeque/data/models/influencer_model.dart';
import 'package:fleeque/data/models/order_details_model.dart';

import 'package:fleeque/domain/entities/filtered_influencer.dart';
import 'package:fleeque/domain/entities/order_details.dart';

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

    final bool hasPriceFilter =
        params.price.isNotEmpty && params.price != 'Select';
    final bool hasTimeFilter =
        params.time.isNotEmpty && params.time != 'Select';
    final bool hasFollowersFilter =
        params.followers.isNotEmpty && params.followers != 'Select';
    final bool hasCountryFilter =
        params.country.isNotEmpty && params.country != 'Select';

    final String priceParams = params.price;
    final String timeParams = params.time;
    final String followersParams = params.followers;
    final String countryParams = params.country;

    hasPriceFilter
        ? docs = docs.where(
            (doc) {
              final List<String> priceRange = priceParams.split('-');
              final int minPrice = int.parse(priceRange[0]);
              final int maxPrice = int.parse(priceRange[1]);
              final int price = doc.get('first_option_price');
              return price >= minPrice && price <= maxPrice;
            },
          ).toList()
        : docs;

    hasTimeFilter
        ? docs.sort(
            ((a, b) {
              final int aTime = a.get('time').microsecondsSinceEpoch;
              final int bTime = b.get('time').microsecondsSinceEpoch;
              return timeParams == 'Newest'
                  ? bTime.compareTo(aTime)
                  : aTime.compareTo(bTime);
            }),
          )
        : docs;

    hasFollowersFilter
        ? docs = docs.where(
            (doc) {
              final int followers = doc.get('followers');
              switch (followersParams) {
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
          ).toList()
        : docs;

    hasCountryFilter
        ? docs = docs.where(
            (doc) {
              final country = doc.get('country');
              return country == countryParams;
            },
          ).toList()
        : docs;

    return docs.map(
      (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        return InfluencerMapper.fromJson(doc.data());
      },
    ).toList();
  }

  Future<void> sendOrderToDB(
    OrderDetails params,
  ) async {
    await _db
        .collection('pre_orders')
        .withConverter(
          fromFirestore: (snapshot, _) => OrderDetailsMapper.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (model, _) => model.toJson(),
        )
        .add(
          OrderDetailsMapper(
            influencerName: params.influencerName,
            orderPrice: params.orderPrice,
            orderDescription: params.orderDescription,
          ),
        );
  }
}
