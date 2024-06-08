import 'dart:convert';

import 'package:clean_architecture/data/api/request/logout_body.dart';
import 'package:clean_architecture/data/api/request/sign_in_body.dart';
import 'package:clean_architecture/data/api/request/sign_up_body.dart';
import 'package:clean_architecture/data/api/response/auth_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/domain/constants/http_backpoints.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: HttpBackpoints.baseUrl,
    contentType: "application/json",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  ));

  Future<MyResponse> signIn({required SignInBody body}) async {
    try {
      Response response = await _dio.post(
        HttpBackpoints.signInUrl,
        data: json.encode(body.toJson()),
      );

      response.data = json.decode(response.data);

      return SignInResponse(
        statusCode: response.statusCode!,
        accessToken: response.data["access_token"],
        refreshToken: response.data["refresh_token"],
      );
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }

  Future<MyResponse> signUp({required SignUpBody body}) async {
    try {
      Response response = await _dio.post(
        HttpBackpoints.signUpUrl,
        data: json.encode(body.toJson()),
      );

      response = json.decode(response.data);

      return MyResponse(
        statusCode: response.statusCode!,
      );
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }

  Future<MyResponse> logout({required LogoutBody body}) async {
    try {
      Response response = await _dio.post(
        HttpBackpoints.logoutUrl,
        data: json.encode(body.toJson()),
      );
      return MyResponse(
        statusCode: response.statusCode!,
      );
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }
}
