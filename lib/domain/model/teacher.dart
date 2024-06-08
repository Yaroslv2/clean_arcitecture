class Teacher {
  final String name;
  final String patronymic;
  final String surname;
  final String department;

  Teacher({
    required this.name,
    required this.patronymic,
    required this.surname,
    required this.department,
  });

  String get fullname => surname + " " + name + " " + patronymic;
}
