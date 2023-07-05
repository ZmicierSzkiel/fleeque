part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

final class RegistrationButtonPressedEvent extends RegistrationEvent {
  const RegistrationButtonPressedEvent();

  @override
  List<Object?> get props => [];
}

final class RegistrationEmailChangedEvent extends RegistrationEvent {
  const RegistrationEmailChangedEvent({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

final class RegistrationPasswordChangedEvent extends RegistrationEvent {
  const RegistrationPasswordChangedEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}
