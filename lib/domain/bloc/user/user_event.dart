part of 'user_bloc.dart';

@immutable
sealed class UserEvent {
  const UserEvent();

  factory UserEvent.getUserInfo() => _GetUserInfo();
  factory UserEvent.disableError() => _DisableError();
}

class _GetUserInfo extends UserEvent {}

class _FailureLogout extends UserEvent {
  final String errorMessage;

  const _FailureLogout({required this.errorMessage});
}

class _DisableError extends UserEvent {}

class _DeleteUser extends UserEvent {}