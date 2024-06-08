import 'package:clean_architecture/data/api/model/user_api.dart';
import 'package:clean_architecture/domain/model/user.dart';

class UserMapper {
  static User fromJson({
    required UserApi userApi,
    required String env,
    required String dep,
  }) {
    return User(
      id: userApi.id,
      email: userApi.email,
      groupId: userApi.groupId,
      name: userApi.name,
      surname: userApi.surname,
      patronymic: userApi.patronymic,
      roleId: userApi.roleId,
      depId: userApi.depId,
      env: env,
      dep: dep,
    );
  }
}
