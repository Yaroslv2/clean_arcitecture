class Department {
  int id;
  String name;
  int envId;

  Department({required this.id, required this.name, required this.envId});

  factory Department.fromJson(Map<String, dynamic> json) =>
      Department(
        id: json["id"] as int,
        name: json["name"] as String,
        envId: json["env_id"] as int,
      );
}
