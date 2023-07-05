part of 'registration_bloc.dart';

enum RegistrationStatus {
  success,
  failure,
  loading,
}

class RegistrationState {
  const RegistrationState({
    this.email = '',
    this.password = '',
    this.status = RegistrationStatus.loading,
    this.message = '',
    this.confirmPassword = '',
  });

  final String email;
  final String password;
  final RegistrationStatus status;
  final String message;
  final String confirmPassword;

  RegistrationState copyWith({
    String? email,
    String? password,
    RegistrationStatus? status,
    String? message,
    String? confirmPassword,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
