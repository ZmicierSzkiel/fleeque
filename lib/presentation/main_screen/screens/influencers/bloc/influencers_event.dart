part of 'influencers_bloc.dart';

sealed class InfluencersEvent {
  const InfluencersEvent();
}

final class GetInfluencersEvent extends InfluencersEvent {
  const GetInfluencersEvent();
}

final class RenderInfluencersEvent extends InfluencersEvent {
  const RenderInfluencersEvent();
}
