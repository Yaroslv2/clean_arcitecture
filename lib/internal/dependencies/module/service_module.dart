import 'package:clean_architecture/data/api/service/auth_service.dart';
import 'package:clean_architecture/data/api/service/courses_service.dart';
import 'package:clean_architecture/data/api/service/department_service.dart';
import 'package:clean_architecture/data/api/service/enviroment_service.dart';
import 'package:clean_architecture/data/api/service/user_service.dart';
import 'package:clean_architecture/internal/dependencies/module/api_module.dart';

class ServiceModule {
  static AuthService? _authService;
  static UserService? _userService;
  static final CoursesService coursesService = CoursesService();
  static final DepartmentService departmentService = DepartmentService();
  static final EnviromentService enviromentService = EnviromentService();

  static AuthService authService() {
    _authService ??= AuthService();

    return _authService!;
  }

  static UserService userService() {
    _userService ??= UserService(apiUtil: ApiModule.apiUtil());

    return _userService!;
  }
}
