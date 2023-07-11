// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Influencer extends Equatable {
  const Influencer({
    required this.name,
    required this.image,
    required this.followers,
    required this.posts,
    required this.country,
    required this.firstOptionPrice,
    required this.secondOptionPrice,
    required this.extraOptionPrice,
    required this.time,
  });

  final String name;
  final String image;
  final int followers;
  final int posts;
  final String country;
  final int firstOptionPrice;
  final int secondOptionPrice;
  final int extraOptionPrice;

  final Timestamp time;

  @override
  List<Object?> get props => [
        name,
        image,
        followers,
        posts,
        country,
        firstOptionPrice,
        secondOptionPrice,
        extraOptionPrice,
        time,
      ];
}
