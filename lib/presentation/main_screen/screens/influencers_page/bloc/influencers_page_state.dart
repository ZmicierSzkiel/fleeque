part of 'influencers_page_bloc.dart';

class InfluencersPageState extends Equatable {
  final List<Influencer> influencers;
  final String selectedOption;
  final String orderDescription;
  final String influencerName;
  final int orderPrice;

  const InfluencersPageState({
    required this.influencers,
    required this.selectedOption,
    required this.orderDescription,
    required this.influencerName,
    required this.orderPrice,
  });

  InfluencersPageState copyWith({
    List<Influencer>? influencers,
    String? selectedOption,
    String? orderDescription,
    String? influencerName,
    int? orderPrice,
  }) {
    return InfluencersPageState(
      influencers: influencers ?? this.influencers,
      selectedOption: selectedOption ?? this.selectedOption,
      orderDescription: orderDescription ?? this.orderDescription,
      influencerName: influencerName ?? this.influencerName,
      orderPrice: orderPrice ?? this.orderPrice,
    );
  }

  @override
  List<Object> get props {
    return [
      influencers,
      selectedOption,
      orderDescription,
      influencerName,
      orderPrice,
    ];
  }
}
