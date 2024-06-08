import 'dart:convert';

import 'package:clean_architecture/data/repository/token_repository.dart';
import 'package:clean_architecture/domain/bloc/auth/auth_bloc.dart';
import 'package:clean_architecture/domain/constants/http_backpoints.dart';
import 'package:clean_architecture/internal/dependencies/module/repository_module.dart';
import 'package:dio/dio.dart';

class Middleware extends Interceptor {
  final TokenRepository _tokenRepository = RepositoryModule.tokenRepository;
  static late AuthBloc _authBloc;

  static addAuthBloc({required AuthBloc authBloc}) {
    _authBloc = authBloc;
  }

  Middleware();

  Future<void> _refreshToken() async {
    String? refresh = _tokenRepository.getRefreshToken();
    if (refresh == null) {
      throw Exception("Refresh token is null");
    }
    try {
      var params = {
        "refresh_token": refresh,
      };

      final Dio dio = Dio(BaseOptions(
        baseUrl: HttpBackpoints.baseUrl,
        contentType: "application/json",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ));

      Response response =
          await dio.post(HttpBackpoints.refreshUrl, data: json.encode(params));

      response.data = json.decode(response.data);

      await _tokenRepository.saveTokensInStorage(
          access: response.data["access_token"],
          refresh: response.data["refresh_token"]);
    } catch (error) {
      rethrow;
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.headers.containsKey("needToken")) {
      return super.onRequest(options, handler);
    }

    options.headers.remove("needToken");
    if (_tokenRepository.isTokenExpired()) {
      try {
        await _refreshToken();
      } catch (error) {
        print("Middleware: failed to refresh token: $error");
        handler.reject(DioException(
            requestOptions: options,
            response: Response(
              data: "",
              requestOptions: options,
              statusCode: 401,
            )));
      }
    }
    String? access = _tokenRepository.getAccessToken();
    options.headers["Authorization"] = "Bearer $access";

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.response!.statusCode) {
      case 401:
        print(err);
        _authBloc
            .add(AuthEvent.failureLogout(errorMessage: "Ваша сессия устарела"));
        break;
      default:
        break;
    }
    super.onError(err, handler);
  }
}
