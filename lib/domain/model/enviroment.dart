class Enviroment {
  int id;
  String name;

  Enviroment({
    required this.id,
    required this.name,
  });

  factory Enviroment.fromJson(Map<String, dynamic> json) =>
      Enviroment(
        id: json["id"] as int,
        name: json["name"] as String,
      );
}
