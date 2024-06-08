class User {
  final int id;
  final String email;
  final int groupId;
  final String name;
  final String surname;
  final String patronymic;
  final int roleId;
  final int depId;
  final String dep;
  final String env;

  User({
    required this.id,
    required this.email,
    required this.groupId,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.roleId,
    required this.depId,
    required this.dep,
    required this.env,
  });

  String get fullname => surname + " " + name + " " + patronymic;

  String get role {
    if (roleId == 1) {
      return "Студент";
    }
    if (roleId == 2) {
      return "Учитель";
    }
    return "Администратор";
  }
}
