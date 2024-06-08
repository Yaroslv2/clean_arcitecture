class SignUpBody {
  final String email;
  final String password;
  final String name;
  final String patronymic;
  final String surname;
  final int depId;

  SignUpBody({
    required this.email,
    required this.password,
    required this.name,
    required this.patronymic,
    required this.surname,
    required this.depId,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "patronymic": patronymic,
        "surname": surname,
        "dep_id": depId,
      };
}
