import 'package:cloud_firestore/cloud_firestore.dart';

class Influencer {
  const Influencer({
    required this.name,
    required this.image,
    required this.followers,
    required this.posts,
    required this.country,
    required this.price,
    required this.time,
  });

  final String name;
  final String image;
  final int followers;
  final int posts;
  final String country;
  final int price;
  final Timestamp time;
}
