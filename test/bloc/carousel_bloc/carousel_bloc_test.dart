import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fleeque/presentation/auth/carousel/bloc/carousel_bloc.dart';

void main() {
  group(
    'CarouselBloc',
    () {
      late CarouselBloc carouselBloc;

      setUp(
        () {
          carouselBloc = CarouselBloc();
        },
      );

      tearDown(
        () {
          carouselBloc.close();
        },
      );

      blocTest<CarouselBloc, CarouselState>(
        'emits the correct state when handling GetCurrentSlideEvent',
        build: () => carouselBloc,
        act: (bloc) => bloc.add(const GetCurrentSlideEvent(index: 3)),
        expect: () => [
          const CarouselState(
            slideItemTitle:
                'Create the perfect shoutout to your friends from their favorite influencers',
            slideDescriptionsList: [
              'Is it your friends birthday and you want to get her something unforgettable. Why not buy her a birthday greeting from her favorite influencer?',
              'Is your friend getting married and you want to send her a little extra special wedding wish? Who better than her favorite celebrity?',
              'Have you dreamt about appearing on the instagram story of your favorite influencer, why not buy a shoutout on her story tagging you for the world to see?'
            ],
            position: 3,
          )
        ],
      );
    },
  );
}
