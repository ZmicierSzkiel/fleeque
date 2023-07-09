import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/domain/entities/influencer.dart';

class HomeCarouselTile extends StatelessWidget {
  final Influencer influencer;
  final bool showDetails;

  const HomeCarouselTile({
    Key? key,
    required this.influencer,
    required this.showDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              influencer.image,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: showDetails
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            influencer.name,
                            key: const Key('homeScreenInfluencerName'),
                            style: AppFonts.mediumFontPrefsWhite,
                          ),
                        ),
                        influencer.followers >= 1000
                            ? Text(
                                '${(influencer.followers * 0.001).toString()}M followers'
                                    .toUpperCase(),
                                style: AppFonts.smallFontPrefsWhite,
                              )
                            : Text(
                                '${(influencer.followers).toString()}K followers'
                                    .toUpperCase(),
                                style: AppFonts.smallFontPrefsWhite,
                              ),
                        Text(
                          '${(influencer.posts).toString()} posts'
                              .toUpperCase(),
                          style: AppFonts.smallFontPrefsWhite,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 10.0),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          influencer.name,
                          key: const Key('influencersScreenInfluencerName'),
                          style: AppFonts.largeFontPrefsWhite,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
