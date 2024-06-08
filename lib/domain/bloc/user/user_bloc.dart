import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:clean_architecture/data/repository/user_repository.dart';
import 'package:clean_architecture/domain/bloc/auth/auth_bloc.dart';
import 'package:clean_architecture/domain/model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthBloc _authBloc;
  late final StreamSubscription _authSubscription;
  final UserRepository _userRepository;

  UserBloc({required UserRepository userRepository, required AuthBloc authBloc})
      : _userRepository = userRepository,
        _authBloc = authBloc,
        super(UserState.initial()) {
    subscriptionOnAuthBloc();
    on<_GetUserInfo>(_getUserInfo);
    on<_FailureLogout>(_failureLogout);
    on<_DeleteUser>(_deleteUser);
  }

  _getUserInfo(_GetUserInfo event, Emitter<UserState> emit) async {
    try {
      User user = await _userRepository.getUser();
      emit(state.copyWith(user: user, status: UserStatus.authorized));
    } catch (e) {
      print("catchExteption $e");
      emit(state.copyWith(user: null, status: UserStatus.notAuthorized));
    }
  }

  _failureLogout(_FailureLogout event, Emitter<UserState> emit) async {
    emit(state.copyWith(
      status: UserStatus.notAuthorized,
      errorMessage: event.errorMessage,
      isError: true,
    ));
  }

  _disableError(_DisableError event, Emitter<UserState> emit) async {
    emit(state.copyWith(isError: false));
  }

  _deleteUser(_DeleteUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(
      user: null,
      status: UserStatus.notAuthorized,
    ));
  }

  subscriptionOnAuthBloc() {
    _authSubscription = _authBloc.stream.listen((AuthState state) {
      if (state.state == AuthStatus.autheficated) {
        add(_GetUserInfo());
      }
      if (state.state == AuthStatus.failureLogout) {
        add(_FailureLogout(
            errorMessage: state.errorMessage ?? "Ошибка токена"));
      }
      if (state.state == AuthStatus.notAutheficated) {
        add(_DeleteUser());
      }
    });
  }
}
