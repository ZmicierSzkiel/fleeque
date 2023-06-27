import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/presentation/main_screen/screens/about/widgets/about_button.dart';
import 'package:fleeque/presentation/main_screen/screens/about/widgets/about_text_block.dart';

class AboutForm extends StatelessWidget {
  const AboutForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutButton(
                title: 'All about',
              ),
              AboutTextBlock(
                title: 'The new era of shoutouts',
                textStyle: AppFonts.xLargeFontPrefsBlack,
              ),
              AboutTextBlock(
                title:
                    'Is it your friends birthday, graduation, bachelorette party or maybe you just want a shoutout from your favorite influencers?',
                textStyle: AppFonts.mediumFontPrefsBlack,
              ),
              AboutTextBlock(
                title:
                    'On Fleeque you buy your greetings for these occasions and the influencers will record a video and tag you or your friend on that special day and upload it to their story for the world to see. ',
                textStyle: AppFonts.mediumFontPrefsBlack,
              ),
              AboutTextBlock(
                title: 'How it works?',
                textStyle: AppFonts.xLargeFontPrefsBlack,
              ),
              AboutButton(
                title: 'Step 01',
              ),
              AboutTextBlock(
                title: 'You simply find your favorite influencer.',
                textStyle: AppFonts.mediumFontPrefsBlack,
              ),
              AboutTextBlock(
                title:
                    "If you don't find them just let us know and we will make sure they join Fleeque soon",
                textStyle: AppFonts.mediumFontPrefsBlack,
              ),
              AboutButton(
                title: 'Step 02',
              ),
              AboutTextBlock(
                title:
                    'Create your account and fill in the greeting information, once the message has been posted on your special day, the payment will processed. ',
                textStyle: AppFonts.mediumFontPrefsBlack,
              ),
              AboutTextBlock(
                title:
                    "Remember, here at Fleeque its a bit of a first come first serve policy so make sue you that you're quick. Each influencer will only do 10 services month so you better be quick to join.",
                textStyle: AppFonts.mediumFontPrefsBlack,
              ),
              AboutTextBlock(
                title: 'Enjoy and welcome to the Fleeque family!',
                textStyle: AppFonts.xLargeFontPrefsBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
