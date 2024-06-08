import 'package:clean_architecture/data/api/response/dep_response.dart';
import 'package:clean_architecture/data/api/response/env_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/service/department_service.dart';
import 'package:clean_architecture/data/api/service/enviroment_service.dart';
import 'package:clean_architecture/domain/model/department.dart';
import 'package:clean_architecture/domain/model/enviroment.dart';
import 'package:clean_architecture/internal/dependencies/module/service_module.dart';

class SignUpPageRepository {
  final DepartmentService _departmentService = ServiceModule.departmentService;
  final EnviromentService _enviromentService = ServiceModule.enviromentService;

  Future<List<Enviroment>> getEnviroments() async {
    MyResponse response = await _enviromentService.getEnviroments();
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }
    return (response as EnviromentsResponse).envs;
  }

  Future<List<Department>> getDepartments({required int envId}) async {
    MyResponse response = await _departmentService.getDepartments(id: envId);
    if (response is FailureResponse) {
      throw Exception(response.errorMessage);
    }
    return (response as DepartmentsResponse).deps;
  }
}
