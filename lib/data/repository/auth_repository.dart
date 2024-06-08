import 'package:clean_architecture/data/api/request/logout_body.dart';
import 'package:clean_architecture/data/api/request/sign_in_body.dart';
import 'package:clean_architecture/data/api/request/sign_up_body.dart';
import 'package:clean_architecture/data/api/response/auth_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/service/auth_service.dart';
import 'package:clean_architecture/data/repository/token_repository.dart';
import 'package:clean_architecture/internal/dependencies/module/repository_module.dart';
import 'package:clean_architecture/internal/dependencies/module/service_module.dart';

class AuthRepository {
  final AuthService _authService = ServiceModule.authService();
  final TokenRepository _tokenRepository = RepositoryModule.tokenRepository;

  Future<void> signIn({required String email, required String password}) async {
    final SignInBody body = SignInBody(email: email, password: password);
    final MyResponse response = await _authService.signIn(body: body);
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }

    final SignInResponse signInResponse = response as SignInResponse;
    _tokenRepository.saveTokensInStorage(
      access: signInResponse.accessToken,
      refresh: signInResponse.refreshToken,
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String patronymic,
    required String surname,
    required int depId,
  }) async {
    final SignUpBody body = SignUpBody(
      email: email,
      password: password,
      name: name,
      patronymic: patronymic,
      surname: surname,
      depId: depId,
    );
    final MyResponse response = await _authService.signUp(body: body);
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }

    await signIn(email: email, password: password);
  }

  Future<void> logout() async {
    final LogoutBody body =
        LogoutBody(refresh: _tokenRepository.getRefreshToken()!);
    final MyResponse response = await _authService.logout(body: body);
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }
    _tokenRepository.removeTokensFromStorage();
  }
}
