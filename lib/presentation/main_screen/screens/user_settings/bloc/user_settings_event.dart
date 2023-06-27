part of 'user_settings_bloc.dart';

abstract class UserSettingsEvent {
  const UserSettingsEvent();
}

class SignOutPressedEvent extends UserSettingsEvent {
  const SignOutPressedEvent();
}
