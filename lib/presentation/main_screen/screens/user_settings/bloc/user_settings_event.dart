part of 'user_settings_bloc.dart';

sealed class UserSettingsEvent extends Equatable {
  const UserSettingsEvent();
}

final class SignOutPressedEvent extends UserSettingsEvent {
  const SignOutPressedEvent();

  @override
  List<Object?> get props => [];
}
