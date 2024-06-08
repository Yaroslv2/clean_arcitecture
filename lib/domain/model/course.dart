import 'package:clean_architecture/domain/model/teacher.dart';

class Course {
  final int id;
  final String name;
  final int term;
  final String department;
  final Teacher teacher;
  final DateTime modifyAt;

  Course({
    required this.id,
    required this.name,
    required this.term,
    required this.department,
    required this.teacher,
    required this.modifyAt,
  });
}
