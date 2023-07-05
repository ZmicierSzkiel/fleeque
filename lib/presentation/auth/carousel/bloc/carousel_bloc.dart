import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc()
      : super(
          const CarouselState(
            slideItemTitle:
                'Create the perfect shoutout to your friends from their favorite influencers',
            slideDescriptionsList: [
              'Is it your friends birthday and you want to get her something unforgettable. Why not buy her a birthday greeting from her favorite influencer?',
              'Is your friend getting married and you want to send her a little extra special wedding wish? Who better than her favorite celebrity?',
              'Have you dreamt about appearing on the instagram story of your favorite influencer, why not buy a shoutout on her story tagging you for the world to see?'
            ],
            position: 0,
          ),
        ) {
    on<GetCurrentSlideEvent>(_handleGetCurrentSlideEvent);
  }

  void _handleGetCurrentSlideEvent(
    GetCurrentSlideEvent event,
    Emitter<CarouselState> emit,
  ) {
    emit(
      state.copyWith(position: event.index),
    );
  }
}
