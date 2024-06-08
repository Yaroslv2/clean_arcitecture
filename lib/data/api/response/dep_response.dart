import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/domain/model/department.dart';

class DepByIdResponse extends MyResponse {
  final String dep;
  final int envId;

  DepByIdResponse({
    required super.statusCode,
    required this.dep,
    required this.envId,
  });
}

class DepartmentsResponse extends MyResponse {
  final List<Department> deps;

  DepartmentsResponse({required super.statusCode, required this.deps});
}
