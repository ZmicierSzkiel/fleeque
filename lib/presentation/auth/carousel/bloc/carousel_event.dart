part of 'carousel_bloc.dart';

sealed class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}

final class GetCurrentSlideEvent extends CarouselEvent {
  final double index;

  const GetCurrentSlideEvent(this.index);
}
