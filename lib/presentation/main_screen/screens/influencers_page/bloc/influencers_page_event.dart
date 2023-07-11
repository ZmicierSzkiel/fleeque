part of 'influencers_page_bloc.dart';

sealed class InfluencersPageEvent extends Equatable {
  const InfluencersPageEvent();
}

final class GetInfluencersEvent extends InfluencersPageEvent {
  const GetInfluencersEvent();

  @override
  List<Object?> get props => [];
}

final class RenderInfluencersEvent extends InfluencersPageEvent {
  final List<Influencer> influencers;

  const RenderInfluencersEvent({
    required this.influencers,
  });

  @override
  List<Object?> get props => [influencers];
}

final class OptionTappedEvent extends InfluencersPageEvent {
  final int price;
  final String option;
  final String description;
  final String influencerName;

  const OptionTappedEvent({
    required this.option,
    required this.price,
    required this.description,
    required this.influencerName,
  });

  @override
  List<Object?> get props => [
        option,
        price,
      ];
}

final class SubmitOrderEvent extends InfluencersPageEvent {
  @override
  List<Object?> get props => [];
}
