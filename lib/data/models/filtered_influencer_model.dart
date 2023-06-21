import 'package:fleeque/domain/entities/filtered_influencer.dart';

class FilteredInfluencerMapper extends FilteredInfluencer {
  const FilteredInfluencerMapper({
    required String country,
    required String followers,
    required String price,
    required String time,
  }) : super(
          followers: followers,
          country: country,
          price: price,
          time: time,
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'country': country,
      'followers': followers,
      'price': price,
      'time': time,
    };
  }

  static FilteredInfluencerMapper fromJson(Map<String, dynamic> json) {
    return FilteredInfluencerMapper(
      country: json['country'],
      followers: json['followers'],
      price: json['price'],
      time: json['time'],
    );
  }
}
