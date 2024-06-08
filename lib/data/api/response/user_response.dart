import 'package:clean_architecture/data/api/model/user_api.dart';
import 'package:clean_architecture/data/api/response/my_reposnse.dart';

class GetUserResponse extends MyResponse {
  final UserApi user;

  GetUserResponse({required super.statusCode, required this.user});
}
