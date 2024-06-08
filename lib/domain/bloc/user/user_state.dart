part of 'user_bloc.dart';

class UserState {
  final User? user;
  final UserStatus status;
  final bool isError;
  final String? errorMessage;

  UserState(
      {this.user,
      required this.status,
      this.errorMessage,
      required this.isError});

  factory UserState.initial() => UserState(
        user: null,
        status: UserStatus.nun,
        errorMessage: null,
        isError: false,
      );

  UserState copyWith({
    User? user,
    UserStatus? status,
    String? errorMessage,
    bool? isError,
  }) =>
      UserState(
        user: user,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        isError: isError ?? this.isError,
      );
}

enum UserStatus { nun, authorized, notAuthorized }
