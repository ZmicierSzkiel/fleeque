import 'package:flutter/material.dart';

import 'package:fleeque/domain/entities/influencer.dart';

import 'package:fleeque/presentation/main_screen/screens/influencers/widgets/influencers_form.dart';

class InfluencersScreen extends StatelessWidget {
  final List<Influencer> influencers;

  const InfluencersScreen({
    super.key,
    required this.influencers,
  });

  @override
  Widget build(BuildContext context) {
    return InfluencersForm(
      influencers: influencers,
    );
  }
}
