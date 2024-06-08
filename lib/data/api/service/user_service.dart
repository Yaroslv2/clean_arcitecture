import 'dart:convert';

import 'package:clean_architecture/data/api/model/user_api.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/response/user_response.dart';
import 'package:clean_architecture/data/api/utils/api_util.dart';
import 'package:clean_architecture/domain/constants/http_backpoints.dart';
import 'package:dio/dio.dart';

class UserService {
  final ApiUtil _api;

  UserService({required ApiUtil apiUtil}) : _api = apiUtil;

  Future<MyResponse> getUser() async {
    try {
      Response response = await _api.dio.get(
        HttpBackpoints.userUrl,
        options: Options(headers: {
          "needToken": true,
        }),
      );
      response.data = json.decode(response.data);
      return GetUserResponse(
        statusCode: response.statusCode!,
        user: UserApi.fromJson(response.data),
      );
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }
}
