import 'dart:convert';

import 'package:clean_architecture/data/api/response/env_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/utils/api_util.dart';
import 'package:clean_architecture/domain/constants/http_backpoints.dart';
import 'package:clean_architecture/domain/model/enviroment.dart';
import 'package:clean_architecture/internal/dependencies/module/api_module.dart';
import 'package:dio/dio.dart';

class EnviromentService {
  final ApiUtil _api = ApiModule.apiUtil();

  Future<MyResponse> getEnviroments() async {
    try {
      Response response = await _api.dio.get(
        HttpBackpoints.getEducationalEnvsUrl,
      );

      response.data = json.decode(response.data);
      return EnviromentsResponse(
        statusCode: response.statusCode!,
        envs: List<Enviroment>.from(
          response.data.map((i) => Enviroment.fromJson(i)),
        ),
      );
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }

  Future<MyResponse> getEnviromentbyId({required int id}) async {
    try {
      Response response = await _api.dio.get(
        HttpBackpoints.getEducationalEnvById + "$id",
        options: Options(headers: {
          "needToken": true,
        }),
      );

      response.data = json.decode(response.data);
      return EnvByIdResponse(
          statusCode: response.statusCode!, env: response.data["name"]);
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }
}
