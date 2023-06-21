class InfluencerFilter {
  final String id;
  final String name;
  final String country;
  final int followers;
  final int price;
  final Object date;

  InfluencerFilter({
    required this.id,
    required this.name,
    required this.country,
    required this.followers,
    required this.price,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'country': country,
      'followers': followers,
      'price': price,
      'date': date,
    };
  }

  static InfluencerFilter fromJson(Map<String, dynamic> json) {
    return InfluencerFilter(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      followers: json['followers'],
      price: json['price'],
      date: json['date'],
    );
  }
}
