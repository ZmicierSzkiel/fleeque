part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent();
}

class LoginEmailChangedEvent extends LoginEvent {
  const LoginEmailChangedEvent({required this.email});

  final String email;
}

class LoginPasswordChangedEvent extends LoginEvent {
  const LoginPasswordChangedEvent({required this.password});

  final String password;
}
