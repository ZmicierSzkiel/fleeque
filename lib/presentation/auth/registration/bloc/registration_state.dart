part of 'registration_bloc.dart';

enum RegistrationStatus {
  success,
  failure,
  loading,
}

class RegistrationState extends Equatable {
  const RegistrationState({
    this.email = '',
    this.password = '',
    this.status = RegistrationStatus.loading,
    this.message = '',
  });

  final String email;
  final String password;
  final RegistrationStatus status;
  final String message;

  RegistrationState copyWith({
    String? email,
    String? password,
    RegistrationStatus? status,
    String? message,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        message,
      ];
}
