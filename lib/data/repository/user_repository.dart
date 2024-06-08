import 'package:clean_architecture/data/api/response/dep_response.dart';
import 'package:clean_architecture/data/api/response/env_response.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/data/api/response/user_response.dart';
import 'package:clean_architecture/data/api/service/department_service.dart';
import 'package:clean_architecture/data/api/service/enviroment_service.dart';
import 'package:clean_architecture/data/api/service/user_service.dart';
import 'package:clean_architecture/data/mapper/user_mapper.dart';
import 'package:clean_architecture/domain/model/user.dart';
import 'package:clean_architecture/internal/dependencies/module/service_module.dart';

class UserRepository {
  final UserService _userService = ServiceModule.userService();
  final DepartmentService _departmentService = ServiceModule.departmentService;
  final EnviromentService _enviromentService = ServiceModule.enviromentService;

  Future<User> getUser() async {
    MyResponse userResponse = await _userService.getUser();
    if (userResponse is FailureResponse) {
      throw Exception(userResponse.errorMessage);
    }
    final GetUserResponse getUserResponse = userResponse as GetUserResponse;
    print("${getUserResponse.user.depId}");
    MyResponse depResponse = await _departmentService.getDepById(
      id: getUserResponse.user.depId,
    );
    if (depResponse is FailureResponse) {
      throw Exception(depResponse.errorMessage);
    }
    print("Получил юзера");
    final DepByIdResponse depByIdResponse = depResponse as DepByIdResponse;
    MyResponse envResponse = await _enviromentService.getEnviromentbyId(
      id: depByIdResponse.envId,
    );
    if (envResponse is FailureResponse) {
      throw Exception(envResponse.errorMessage);
    }
    final EnvByIdResponse envByIdResponse = envResponse as EnvByIdResponse;
    return UserMapper.fromJson(
      userApi: getUserResponse.user,
      env: envByIdResponse.env,
      dep: depByIdResponse.dep,
    );
  }
}
