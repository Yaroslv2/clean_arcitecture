class CourseApi {
  final int id;
  final String name;
  final int term;
  final Map<String, dynamic> teacher;
  final String department;
  final int modifyTime;

  CourseApi({
    required this.id,
    required this.name,
    required this.term,
    required this.teacher,
    required this.department,
    required this.modifyTime,
  });

  factory CourseApi.fromJson(Map<String, dynamic> json) => CourseApi(
        id: json["id"],
        name: json["name"],
        term: json["term"],
        teacher: json["teacher"],
        department: json["department"],
        modifyTime: json["modified_at"],
      );
}
