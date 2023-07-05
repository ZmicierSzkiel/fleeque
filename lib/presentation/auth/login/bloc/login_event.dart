part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent();

  @override
  List<Object?> get props => [];
}

final class LoginEmailChangedEvent extends LoginEvent {
  const LoginEmailChangedEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

final class LoginPasswordChangedEvent extends LoginEvent {
  const LoginPasswordChangedEvent({required this.password});

  final String password;

  @override
  List<Object?> get props => [password];
}
