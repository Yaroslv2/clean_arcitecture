import 'package:clean_architecture/data/api/response/my_reposnse.dart';
import 'package:clean_architecture/domain/model/enviroment.dart';

class EnvByIdResponse extends MyResponse {
  final String env;

  EnvByIdResponse({required super.statusCode, required this.env});
}

class EnviromentsResponse extends MyResponse {
  final List<Enviroment> envs;

  EnviromentsResponse({required super.statusCode, required this.envs});
}
