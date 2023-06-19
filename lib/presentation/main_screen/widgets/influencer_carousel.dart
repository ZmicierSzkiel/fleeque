import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:fleeque/domain/entities/influencer.dart';
import 'package:fleeque/presentation/main_screen/widgets/influencer_carousel_tile.dart';

class InfluencerCarousel extends StatelessWidget {
  final List<Influencer> influencers;
  final bool showDetails;

  const InfluencerCarousel({
    Key? key,
    required this.influencers,
    required this.showDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 220,
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        // autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: false,
      ),
      itemCount: influencers.length,
      itemBuilder: (context, index, _) {
        return HomeCarouselTile(
          influencer: influencers[index],
          showDetails: showDetails,
        );
      },
    );
  }
}
