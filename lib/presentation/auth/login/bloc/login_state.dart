part of 'login_bloc.dart';

enum LoginStatus {
  success,
  failure,
  loading,
}

class LoginState {
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.loading,
    this.message = '',
  });

  final String email;
  final String password;
  final LoginStatus status;
  final String message;

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
