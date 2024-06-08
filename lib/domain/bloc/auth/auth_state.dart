part of 'auth_bloc.dart';

class AuthState {
  final AuthStatus state;
  final String? errorMessage;

  AuthState({required this.state, this.errorMessage});

  factory AuthState.initial() => AuthState(
        state: AuthStatus.nun,
        errorMessage: null,
      );

  AuthState copyWith({
    AuthStatus? state,
    String? errorMessage,
  }) =>
      AuthState(
        state: state ?? this.state,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

enum AuthStatus {
  nun,
  autheficated,
  notAutheficated,
  failure,
  loading,
  failureLogout
}
