import 'dart:convert';

import 'package:clean_architecture/data/api/response/dep_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/utils/api_util.dart';
import 'package:clean_architecture/domain/constants/http_backpoints.dart';
import 'package:clean_architecture/domain/model/department.dart';
import 'package:clean_architecture/internal/dependencies/module/api_module.dart';
import 'package:dio/dio.dart';

class DepartmentService {
  final ApiUtil _api = ApiModule.apiUtil();

  Future<MyResponse> getDepartments({required int id}) async {
    try {
      Response response = await _api.dio.get(
        "${HttpBackpoints.getDepartmentsByEnvIdUrl}$id",
      );

      response.data = json.decode(response.data);
      return DepartmentsResponse(
          statusCode: response.statusCode!,
          deps: List<Department>.from(
            response.data.map((i) => Department.fromJson(i)),
          ));
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }

  Future<MyResponse> getDepById({required int id}) async {
    try {
      Response response = await _api.dio.get(
        "${HttpBackpoints.getDepartmentById}$id",
        options: Options(headers: {
          "needToken": true,
        }),
      );

      response.data = json.decode(response.data);
      return DepByIdResponse(
        statusCode: response.statusCode!,
        dep: response.data["name"],
        envId: response.data["env_id"],
      );
    } on DioException catch (e) {
      return formFailureResponse(e);
    }
  }
}
