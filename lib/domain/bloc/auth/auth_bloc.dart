import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState.initial()) {
    on<_SignInEvent>(_signIn);
    on<_LogoutEvent>(_logout);
  }

  _signIn(_SignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(state: AuthStatus.loading));
      await _authRepository.signIn(
          email: event.email, password: event.password);
      emit(state.copyWith(state: AuthStatus.autheficated));
    } catch (e) {
      emit(state.copyWith(
          state: AuthStatus.failure, errorMessage: e.toString()));
    }
  }

  _logout(_LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(state: AuthStatus.notAutheficated));
      await _authRepository.logout();
    } catch (e) {
      emit(state.copyWith(state: AuthStatus.notAutheficated));
    }
  }

  _failureLogout(_FailureLogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.logout();
      emit(state.copyWith(
        state: AuthStatus.failureLogout,
        errorMessage: event.errorMessage,
      ));
    } catch (e) {
      emit(state.copyWith(
        state: AuthStatus.failureLogout,
        errorMessage: event.errorMessage,
      ));
    }
  }
}
