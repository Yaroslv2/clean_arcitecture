part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();

  factory AuthEvent.signIn({required String email, required String password}) =>
      _SignInEvent(
        email: email,
        password: password,
      );
  factory AuthEvent.logout() => _LogoutEvent();
  factory AuthEvent.failureLogout({required String errorMessage}) =>
      _FailureLogoutEvent(errorMessage: errorMessage);
}

class _SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const _SignInEvent({required this.email, required this.password});
}

class _LogoutEvent extends AuthEvent {}

class _FailureLogoutEvent extends AuthEvent {
  final String errorMessage;

  const _FailureLogoutEvent({required this.errorMessage});
}
