class UserApi {
  final int id;
  final String email;
  final int groupId;
  final String name;
  final String surname;
  final String patronymic;
  final int roleId;
  final int depId;

  UserApi({
    required this.id,
    required this.email,
    required this.groupId,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.roleId,
    required this.depId,
  });

  factory UserApi.fromJson(Map<String, dynamic> json) => UserApi(
        id: json["id"],
        email: json["email"],
        groupId: json["group_id"],
        name: json["name"],
        surname: json["surname"],
        patronymic: json["patronymic"],
        roleId: json["role_id"],
        depId: json["dep_id"],
      );
}
