import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/domain/entities/influencer.dart';

class InfluencerListTile extends StatelessWidget {
  final Influencer influencer;

  const InfluencerListTile({
    super.key,
    required this.influencer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: ListTile(
        leading: SizedBox(
            width: 60.0,
            height: 60.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                influencer.image,
                fit: BoxFit.cover,
              ),
            )),
        title: Text(
          influencer.name,
          style: AppFonts.mediumFontPrefsBlack,
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Followers',
                  style: AppFonts.smallFontPrefsBlack,
                ),
                influencer.followers >= 1000
                    ? Text(
                        '${(influencer.followers * 0.001).toString()}M',
                        style: AppFonts.smallFontPrefsBlack,
                      )
                    : Text(
                        '${(influencer.followers).toString()}K',
                        style: AppFonts.smallFontPrefsBlack,
                      ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Posts',
                  style: AppFonts.smallFontPrefsBlack,
                ),
                Text(
                  (influencer.posts).toString(),
                  style: AppFonts.smallFontPrefsBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
