part of 'registration_bloc.dart';

abstract class RegistrationEvent {
  const RegistrationEvent();
}

class RegistrationButtonPressedEvent extends RegistrationEvent {
  const RegistrationButtonPressedEvent();
}

class RegistrationEmailChangedEvent extends RegistrationEvent {
  const RegistrationEmailChangedEvent({
    required this.email,
  });

  final String email;
}

class RegistrationPasswordChangedEvent extends RegistrationEvent {
  const RegistrationPasswordChangedEvent({
    required this.password,
  });

  final String password;
}
