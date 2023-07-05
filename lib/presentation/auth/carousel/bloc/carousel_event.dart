part of 'carousel_bloc.dart';

sealed class CarouselEvent extends Equatable {
  const CarouselEvent();
}

final class GetCurrentSlideEvent extends CarouselEvent {
  final double index;

  const GetCurrentSlideEvent({required this.index});

  @override
  List<Object> get props => [index];
}
