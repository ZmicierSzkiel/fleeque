import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleeque/domain/entities/influencer.dart';

class InfluencerMapper extends Influencer {
  const InfluencerMapper({
    required String name,
    required int followers,
    required int posts,
    required String image,
    required String country,
    required int firstOptionPrice,
    required int secondOptionPrice,
    required int extraOptionPrice,
    required Timestamp time,
  }) : super(
          name: name,
          followers: followers,
          posts: posts,
          image: image,
          country: country,
          firstOptionPrice: firstOptionPrice,
          secondOptionPrice: secondOptionPrice,
          extraOptionPrice: extraOptionPrice,
          time: time,
        );

  static InfluencerMapper fromJson(Map<String, dynamic> json) {
    return InfluencerMapper(
      name: json['name'],
      followers: json['followers'],
      posts: json['posts'],
      image: json['image'],
      country: json['country'],
      firstOptionPrice: json['first_option_price'],
      secondOptionPrice: json['second_option_price'],
      extraOptionPrice: json['extra_option_price'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'followers': followers,
        'posts': posts,
        'image': image,
        'country': country,
        'firstOptionPrice': firstOptionPrice,
        'secondOptionPrice': secondOptionPrice,
        'extraOptionPrice': extraOptionPrice,
        'time': time,
      };
}
