import 'package:flutter/material.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/presentation/main_screen/widgets/influencer_list_tile.dart';

class InfluencersList extends StatelessWidget {
  final List<Influencer> influencers;
  final int length;

  const InfluencersList({
    Key? key,
    required this.influencers,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: length,
      itemBuilder: (context, index) {
        final itemIndex = index % influencers.length;
        return InfluencerListTile(influencer: influencers[itemIndex]);
      },
    );
  }
}
