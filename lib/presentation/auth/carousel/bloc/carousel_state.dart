part of 'carousel_bloc.dart';

class CarouselState extends Equatable {
  final String slideItemTitle;
  final List<String> slideDescriptionsList;
  final double position;

  const CarouselState({
    required this.slideItemTitle,
    required this.slideDescriptionsList,
    required this.position,
  });

  @override
  List<Object> get props => [
        slideItemTitle,
        slideDescriptionsList,
        position,
      ];

  CarouselState copyWith({
    String? slideItemTitle,
    List<String>? slideDescriptionsList,
    double? position,
  }) {
    return CarouselState(
      slideItemTitle: slideItemTitle ?? this.slideItemTitle,
      slideDescriptionsList:
          slideDescriptionsList ?? this.slideDescriptionsList,
      position: position ?? this.position,
    );
  }
}
